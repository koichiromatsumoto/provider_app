import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/colors.dart';

class DeviseMaxWidthBtn extends StatelessWidget {
  final String text;
  final dynamic nextPage;

  @override
  DeviseMaxWidthBtn(this.text, this.nextPage);
  Widget build(BuildContext context) {
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
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute<PageRoute<Widget>>(
              builder: (_) => nextPage
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: const Border(
          bottom: const BorderSide(
            color: AppColor.MAX_WIDTH_BTN_BORDER_COLOR,
          ),
        ),
      ),
    );
  }
}