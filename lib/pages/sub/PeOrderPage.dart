import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/utils/TimeUtils.dart';

class PeOrderPage extends StatefulWidget {
  PeOrderPageState createState() => new PeOrderPageState();
}

class PeOrderPageState extends State<PeOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.topBarColor,
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: TestData.userName,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextSpan(
              text: '(点击切换)',
              style: TextStyle(
                color: Colors.lightGreenAccent,
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
        itemCount: TestData.peOrders.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            // width: Screen.width - 40,
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: _buildReportRow(context, index),
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

  Widget _buildReportRow(BuildContext context, int index) {
    Map info = TestData.peOrders[index];
    switch (info['type']) {
      case 'unuse':
        return Container(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: GlobalConfig.appName +
                      '【' +
                      chineseDateTimeFormat(info['date']) +
                      '】\n',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: TestData.userName,
                  style: TextStyle(color: GlobalConfig.topBarColor),
                ),
                TextSpan(
                  text: ' 已预约常规体检，请您于' +
                      chineseDateTimeFormat(info['time']) +
                      '，空腹到医院体检中心进行体检。',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        );
      case 'used':
        return Container(
            child: Text(
          '过往体检：' +
              chineseDateTimeFormat(info['time']) +
              '\n' +
              '${TestData.userName} 曾进行常规体检。',
          style: TextStyle(color: Colors.grey[500]),
        ));
      default:
        return Text(
          chineseDateFormat(info['time']) + '已预约',
          style: TextStyle(color: GlobalConfig.topBarColor),
        );
    }
  }
}
