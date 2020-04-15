import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static void confirm(BuildContext context,
      {String title = '',
      String message = '',
      VoidCallback onCancel,
      VoidCallback onConfirm}) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            content: Text(
              message,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
            ),
            actions: <Widget>[
              CupertinoDialogAction(onPressed: onCancel, child: Text("cancel")),
              CupertinoDialogAction(onPressed: onConfirm, child: Text("ok")),
            ],
          );
        });
  }
}
