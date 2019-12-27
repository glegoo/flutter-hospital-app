import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/utils/DialogUtils.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';

class PaymentDetailPage extends StatefulWidget {
  final bool paid;
  PaymentDetailPage({Key key, this.paid}) : super(key: key);
  PaymentDetailPageState createState() => new PaymentDetailPageState();
}

class PaymentDetailPageState extends State<PaymentDetailPage> {
  bool _paid = false;
  @override
  void initState() {
    super.initState();
    _paid = widget.paid;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(color: Colors.grey[800], fontSize: 16);
    TextStyle green =
        TextStyle(color: GlobalConfig.bottomBarColor, fontSize: 16);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.topBarColor,
        title: Text('${TestData.userName} 订单'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text:
                              '发票单号：${TestData.orderId}\n\n科室：${TestData.orderOffice}',
                          style: style),
                      TextSpan(
                          text:
                              '\n\n${_paid ? '已完成缴费' : '待缴费金额'}：${TestData.orderFee}元\n\n',
                          style: _paid ? green : style),
                      TextSpan(text: TestData.orderDetail, style: style),
                    ],
                  ),
                )),
            Divider(
              thickness: 1.5,
            ),
            _paid
                ? Container()
                : MaterialButton(
                    minWidth: Screen.width - 30,
                    height: 40,
                    child: Text(
                      '使用支付宝支付',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    color: Color(0xff4cc4f9),
                    onPressed: () {
                      _paySuccess();
                    },
                  ),
            _paid
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: MaterialButton(
                      minWidth: Screen.width - 30,
                      height: 40,
                      child: Text(
                        '使用微信支付',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      color: GlobalConfig.bottomBarColor,
                      onPressed: () {
                        _paySuccess();
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void _paySuccess() {
    DialogUtils.show(
      context,
      '已完成缴费',
      '您已完成全部诊疗缴费，祝您健康!',
      callback: () {
        setState(() {
          _paid = true;
        });
      },
    );
  }
}
