import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constant/colors.dart';
import '../provider/navigation_history_provider.dart';

class DeviseMaxWidthBtn extends ConsumerWidget {
  final String text;
  final int tabIndex;
  final dynamic nextPage;

  @override
  DeviseMaxWidthBtn(this.text, this.tabIndex, this.nextPage);
  Widget build(BuildContext context, WidgetRef ref) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: deviceWidth,
      height: 60,
      child: TextButton(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                ),
              ),
              Icon(
                  Icons.arrow_forward_ios
              ),
            ],
          ),
        ),
        onPressed: tabIndex == null ?
            () => Navigator.of(context).push(
            MaterialPageRoute<PageRoute<Widget>>(
                builder: (_) => nextPage)) :
            () => ref.read(navigationHistoryProvider).moveTo(tabIndex),
      ),
      decoration: BoxDecoration(
        border: const Border(
          bottom: const BorderSide(
            color: MAX_WIDTH_BTN_BORDER_COLOR,
          ),
        ),
      ),
    );
  }
}