import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';

class QuestionPage extends StatefulWidget {
  QuestionPageState createState() => new QuestionPageState();
}

class QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('常见问题'),
        backgroundColor: GlobalConfig.topBarColor,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              '常见问题',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(
            height: 20,
            thickness: 1.5,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              '意见反馈',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(
            height: 20,
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
