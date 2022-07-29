import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constant/strings.dart';

class ConfirmDialog extends ConsumerStatefulWidget {
  final String title;
  final String content;
  final VoidCallback onOkTap;

  const ConfirmDialog(this.title, this.content, {this.onOkTap});

  @override
  _ConfirmDialogState createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends ConsumerState<ConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: widget.title != null ? Text(widget.title) : null,
      content: widget.content != null ? Text(widget.content) : null,
      actions: <Widget>[
        TextButton(
          child: Text(CANCEL, style: TextStyle(color: Colors.blue)),
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
        ),
        TextButton(
          child: Text(OK, style: TextStyle(color: Colors.blue)),
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