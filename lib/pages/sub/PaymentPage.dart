import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/pages/sub/PaymentDetailPage.dart';
import 'package:hospital_app/utils/PageRouteUtils.dart';
import 'package:hospital_app/utils/TimeUtils.dart';

class PaymentPage extends StatefulWidget {
  PaymentPageState createState() => new PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
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
        itemCount: TestData.paymentInfos.length,
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
    Map info = TestData.paymentInfos[index];
    switch (info['type']) {
      case 'unuse':
        return Container(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: GlobalConfig.appName +
                      '【' +
                      chineseDateTimeFormat(info['time']) +
                      '】\n',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: TestData.userName,
                  style: TextStyle(color: GlobalConfig.topBarColor),
                ),
                TextSpan(
                  text: ' 有${info['count']}份订单，',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: '点击',
                  style: TextStyle(color: GlobalConfig.topBarColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _openReport(context, 1);
                    },
                ),
                TextSpan(
                  text: '查看详情。',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        );
      case 'used':
        return Container(
            child: Text(
          '过往订单：' +
              chineseDateTimeFormat(info['time']) +
              '\n' +
              '${TestData.userName} 有${info['count']}份缴费订单',
          style: TextStyle(color: Colors.grey[500]),
        ));
      default:
        return Text(
          chineseDateFormat(info['time']),
          style: TextStyle(color: GlobalConfig.topBarColor),
        );
    }
  }

  void _openReport(BuildContext context, int index) {
    routePage(
        context,
        PaymentDetailPage(
          paid: false,
        ));
  }
}
