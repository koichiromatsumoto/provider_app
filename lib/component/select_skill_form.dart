import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';

import '../constant/strings.dart';
import '../model/entity/skills.dart';
import '../provider/skill_select_provider.dart';

// スキル選択フォーム
class SelectSkillForm extends ConsumerStatefulWidget {
  BuildContext conusmerContext;
  final items;
  final multiSelectKey;
  SelectSkillForm(this.conusmerContext, this.items, this.multiSelectKey);

  @override
  _SelectSkillFormState createState() => _SelectSkillFormState();
}

class _SelectSkillFormState extends ConsumerState<SelectSkillForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: MultiSelectDialogField<Skill>(
        key: widget.multiSelectKey,
        title: Text(SELECT_SKILLS),
        buttonText: Text(SELECT_SKILLS_EXPLAIN),
        items: widget.items,
        searchable: true,
        onConfirm: (values) {
          widget.multiSelectKey.currentState.validate();
          setState(() {
            ref.read(skillSelectProvider).handleChange(values);
            ref.read(skillSelectProvider).setDefaultSkillLevels(values);
          });
        },
        chipDisplay: MultiSelectChipDisplay.none(),
      ),
    );
  }
}