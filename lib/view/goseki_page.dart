import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_app/constant/strings.dart';
import 'package:provider_app/model/db/db_manager.dart';

import '../component/inputGosekiDialog.dart';
import '../constant/colors.dart';
import '../model/entity/gosekis.dart';
import '../model/entity/skills.dart';
import '../model/repository/goseki_repository.dart';
import '../model/repository/skill_repository.dart';

class GosekiPage extends ConsumerStatefulWidget {
  @override
  _GosekiPageState createState() => new _GosekiPageState();
}

class _GosekiPageState extends ConsumerState<GosekiPage> {
  List<Skill> skills;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    skillData();
    final DBManager instance = DBManager.instance;
    final db = instance.database;
  }

  Future skillData() async {
    setState(() => isLoading = true);
    skills = await SkillRepository.getAll();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {

    var futureBuilder = FutureBuilder(
      future: GosekiRepository.getAll(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return mainView(context, snapshot.data);
        } else {
          return Scaffold(
              appBar: AppBar(
                title: Text(GOSEKI_PAGE),
                centerTitle: true,
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              )
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(GOSEKI_PAGE),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                inputGosekiDialog(context, ref, skills);
              },
              child: Text(
                "追加",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
          ),
          SizedBox(width: 15)
        ],
      ),
      body: futureBuilder,
      // floatingActionButton: Container(
      //   margin: EdgeInsets.fromLTRB(0, 0, 20, 80),
      //   child: FloatingActionButton(
      //       child: Icon(Icons.add),
      //       onPressed: () {
      //         inputGosekiDialog(context, skills);
      //       }),
      // ),
    );
  }

  Widget mainView(BuildContext context, List<Goseki> gosekis) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 80),
        child: Consumer(
            builder: (context, watch, child) {
              return MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  child: Container(
                      color: LISTVIEW_BACKGROUND_COLOR,
                      child: Scrollbar(
                        child: ListView.separated(
                          itemCount: gosekis.isEmpty ? 0 : gosekis.length,
                          itemBuilder: (BuildContext context, int index) {
                            String firstSkillName;
                            String firstSkillLevel;
                            String secondSkillName;
                            String secondSkillLevel;
                            if (gosekis[index].firstSkillName == null) {
                              firstSkillName = "";
                            } else {
                              firstSkillName = gosekis[index].firstSkillName;
                            }
                            if (gosekis[index].firstSkillLevel == null) {
                              firstSkillLevel = "";
                            } else {
                              firstSkillLevel = gosekis[index].firstSkillLevel.toString();
                            }
                            if (gosekis[index].secondSkillName == null) {
                              secondSkillName = "";
                            } else {
                              secondSkillName = gosekis[index].secondSkillName;
                            }
                            if (gosekis[index].secondSkillLevel == null) {
                              secondSkillLevel = "";
                            } else {
                              secondSkillLevel = gosekis[index].secondSkillLevel.toString();
                            }
                            String gosekiSkill = secondSkillName == "" ?
                            firstSkillName + " Lv." + firstSkillLevel :
                            firstSkillName + " Lv." + firstSkillLevel + "\n" + secondSkillName + " Lv." + secondSkillLevel;
                            String gosekiSlot = gosekis[index].firstSlot.toString() + "-" + gosekis[index].secondSlot.toString() + "-" + gosekis[index].thirdSlot.toString();
                            return Container(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          setState(() {
                                            GosekiRepository.delete(gosekis[index].id);
                                          });
                                        },
                                        highlightColor: SECOND_THEME_COLOR,
                                      ),
                                      padding: EdgeInsets.only(right: 10),
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        gosekiSkill,
                                        // style: TextStyle(fontSize: 10)
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.only(right: 30),
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        gosekiSlot,
                                        // style: TextStyle(fontSize: 10)
                                      ),
                                    ),
                                  ],
                                )
                            );
                          },
                          separatorBuilder: (context, _) => const Divider(),
                        ),
                      )
                  )
              );
            }
        )
    );
  }
}
