import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static AlertDialog dialogUtils;

  static void show(
    BuildContext context,
    String title,
    String msg, {
    String button = '我知道了',
    Function callback,
  }) {
    showDialog<Null>(
        context: context, //BuildContext对象
        builder: (context) {
          return AlertDialog(
            //调用对话框
            title: Text(title),
            content: Text(msg),
            actions: <Widget>[
              FlatButton(
                child: Text(button),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (callback != null) callback();
                },
              )
            ],
          );
        });
  }
}
