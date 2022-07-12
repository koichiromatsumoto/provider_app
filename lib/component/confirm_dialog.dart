import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

import '../constant/strings.dart';
import '../provider/navigation_history_provider.dart';

class ConfirmDialog extends StatefulWidget {
  final String title;
  final String content;
  final VoidCallback onOkTap;

  const ConfirmDialog(this.title, this.content, {this.onOkTap});

  @override
  _ConfirmDialogState createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.title != null ? Text(widget.title) : null,
      content: widget.content != null ? Text(widget.content) : null,
      actions: <Widget>[
        TextButton(
          child: Text(AppString.CANCEL, style: TextStyle(color: Colors.blue)),
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
        ),
        TextButton(
          child: Text(AppString.OK, style: TextStyle(color: Colors.blue)),
          onPressed: () {
            setState(() {
              widget.onOkTap();
            });
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
        )
      ],
    );
  }
}