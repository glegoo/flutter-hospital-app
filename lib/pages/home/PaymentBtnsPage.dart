import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/pages/sub/ParkingPage.dart';
import 'package:hospital_app/pages/sub/PaymentPage.dart';
import 'package:hospital_app/utils/DialogUtils.dart';
import 'package:hospital_app/utils/PageRouteUtils.dart';
import 'package:hospital_app/widget/SubAppBtn.dart';

class PaymentBtnsPage extends StatefulWidget {
  PaymentBtnsPageState createState() => new PaymentBtnsPageState();
}

class PaymentBtnsPageState extends State<PaymentBtnsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.topBarColor,
      ),
      body: new Container(
        color: GlobalConfig.cardBackgroundColor,
        margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SubAppBtn(
                    title: '缴费',
                    iconName: 'jf',
                    backgroundColor: new Color(0xff00e19f),
                    buttonClick: () {
                      routePage(context, PaymentPage());
                    },
                  ),
                  SubAppBtn(
                    title: '停车缴费',
                    iconName: 'tcjf',
                    backgroundColor: new Color(0xfff8ae00),
                    buttonClick: () {
                      routePage(context, ParkingPage());
                      DialogUtils.show(context, '停车缴费规则', TestData.parkingTip);
                    },
                  ),
                  SubAppBtn(
                    title: '体检订单',
                    iconName: 'tjdd',
                    backgroundColor: new Color(0xff4cc4f9),
                    buttonClick: null,
                  ),
                  SubAppBtn(
                    title: '缴费记录',
                    iconName: 'jfjl',
                    backgroundColor: new Color(0xffe289d9),
                    buttonClick: null,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
