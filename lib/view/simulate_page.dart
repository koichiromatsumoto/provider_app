import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider_app/component/devise_max_width_btn.dart';
import 'package:provider_app/component/selected_skills_list_view.dart';
import 'package:provider_app/constant/colors.dart';
import 'package:provider_app/constant/configs.dart';
import 'package:provider_app/constant/strings.dart';
import 'package:provider_app/model/entity/skills.dart';
import 'package:provider_app/view/simulate_detail_setting_page.dart';
import 'package:provider_app/view/simulate_result_page.dart';
import 'package:provider_app/provider/skill_select_provider.dart';
import 'package:provider_app/provider/weapon_slot_provider.dart';

import '../component/select_skill_form.dart';
import '../component/weapon_slot_dropdown.dart';
import '../component/weapon_slot_select_area.dart';

class SimulatePage extends StatefulWidget {

  @override
  _SimulatePageState createState() => new _SimulatePageState();
}

class _SimulatePageState extends State<SimulatePage> {
  final items = Skill.skills
      .map((skill) => MultiSelectItem<Skill>(skill, skill.skillName))
      .toList();
  List<Skill> _selectedSkills = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _selectedSkills = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.SIMULATE_PAGE),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: Column(
          children: [
            Expanded(
              child: Consumer(
                  builder: (context, watch, child){
                    return Column(
                      children: <Widget>[
                        // 検索詳細設定ボタン
                        DeviseMaxWidthBtn(AppString.SIMULATE_DETAIL_SETTING, SimulateDetailSettingPage()),
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