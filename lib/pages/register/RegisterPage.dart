import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/utils/TimeUtils.dart';

class RegisterPage extends StatefulWidget {
  RegisterPageState createState() => new RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: TestData.userName,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 20,
              ),
            ),
            TextSpan(
              text: '(点击切换)',
              style: TextStyle(
                color: GlobalConfig.textLinkColor,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            WidgetSpan(
              child: Icon(
                Icons.keyboard_arrow_down,
                color: GlobalConfig.textLinkColor,
                size: 20,
              ),
            ),
          ]),
        ),
      ),
      body: ListView.separated(
        itemCount: TestData.registerInfos.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            // width: Screen.width - 40,
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: _buildRegisterRow(context, index),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 1.5,
            height: 1.0,
            color: Colors.grey[300],
          );
        },
      ),
    );
  }

  Widget _buildRegisterRow(BuildContext context, int index) {
    switch (TestData.registerInfos[index]['type']) {
      case 'unuse':
        return Container(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: GlobalConfig.appName +
                      '【' +
                      chineseDateTimeFormat(
                          TestData.registerInfos[index]['time']) +
                      '】\n',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: TestData.userName,
                  style: TextStyle(color: GlobalConfig.topBarColor),
                ),
                TextSpan(
                  text: TestData.registerInfos[index]['text'],
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        );
      case 'used':
        return Container(
            child: Text(
          '过往挂号：' +
              chineseDateTimeFormat(TestData.registerInfos[index]['time']) +
              '\n' +
              TestData.userName +
              TestData.registerInfos[index]['text'],
          style: TextStyle(color: Colors.grey[500]),
        ));
      default:
        return Text(
          chineseDateFormat(TestData.registerInfos[index]['time']) + '已挂号',
          style: TextStyle(color: GlobalConfig.topBarColor),
        );
    }
  }
}
