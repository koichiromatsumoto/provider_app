import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider_app/component/confirm_dialog.dart';
import 'package:provider_app/component/devise_max_width_btn.dart';
import 'package:provider_app/component/selected_skills_list_view.dart';
import 'package:provider_app/constant/configs.dart';
import 'package:provider_app/constant/strings.dart';
import 'package:provider_app/model/db/db_manager.dart';
import 'package:provider_app/model/entity/skills.dart';
import 'package:provider_app/model/repository/skill_repository.dart';
import 'package:provider_app/view/simulate_detail_setting_page.dart';
import 'package:provider_app/view/simulate_result_page.dart';
import 'package:provider_app/provider/skill_select_provider.dart';

import '../component/select_skill_form.dart';
import '../component/weapon_slot_select_area.dart';
import '../provider/navigation_history_provider.dart';

class SimulatePage extends StatefulWidget {

  @override
  _SimulatePageState createState() => new _SimulatePageState();
}

class _SimulatePageState extends State<SimulatePage> {
  List<Skill> skills;
  var items = [];
  List<Skill> _selectedSkills = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();
  bool isLoading = false;

  @override
  void initState() {
    _selectedSkills = [];
    super.initState();
    skillData();
  }

  Future skillData() async {
    setState(() => isLoading = true);
    skills = await SkillRepository.getAll();
    items = skills.map((skill) => MultiSelectItem<Skill>(skill, skill.skillName))
        .toList();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.SIMULATE_PAGE),
        centerTitle: true,
      ),
      body: isLoading //「読み込み中」だったらローディングアニメーションを表示
          ? const Center(
        child: CircularProgressIndicator(),
      ) : Container(
        padding: EdgeInsets.only(bottom: 80),
        child: Column(
          children: [
            Expanded(
              child: Consumer(
                builder: (context, watch, child){
                  return Column(
                    children: <Widget>[
                      // 検索詳細設定ボタン
                      DeviseMaxWidthBtn(AppString.SIMULATE_DETAIL_SETTING, null, SimulateDetailSettingPage()),
                      // 護石登録
                      DeviseMaxWidthBtn(AppString.GOSEKI_PAGE, TabIndex.GosekiIndex, null),
                      // 武器スロット選択エリア
                      WeaponSlotSelectArea(context),
                      Expanded(
                        child: Container(
                          width: deviceWidth,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 15),
                            child: Column(
                              children: <Widget>[
                                // スキル選択フォーム
                                SelectSkillForm(context, items, _multiSelectKey),
                                // 選択スキルリストビュー
                                SelectedSkillsListView(context),
                                // スキル全削除ボタン
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(Icons.delete, color:Colors.red),
                                    onPressed: () {
                                      showDialog<void>(
                                        context: context,
                                        builder: (_) {
                                          return ConfirmDialog(
                                            "選択したスキルをすべて削除します",
                                            "よろしいですか？",
                                            onOkTap: () => context.read(skillSelectProvider).allClear(),
                                          );
                                      });
                                      setState(() {
                                        if (context.read(skillSelectProvider).selectedSkills == []) {
                                          context.read(skillSelectProvider).selectedSkills = [];
                                        }
                                      });
                                    },
                                    highlightColor: Colors.deepOrange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // 検索するボタン
                      ElevatedButton(
                        child: const Text(AppString.SIMULATE_BTN),
                        onPressed: context.read(skillSelectProvider).selectedSkills.isEmpty ? null : () => Navigator.of(context).push(
                          MaterialPageRoute<PageRoute<Widget>>(
                            builder: (_) => SimulateResultPage()
                          )
                        )
                      ),
                      ElevatedButton(
                        child: const Text('Button'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          DBManager.instance.destroyDatabase();
                        },
                      ),
                    ],
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}