import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/pages/sub/PeCalendarPage.dart';
import 'package:hospital_app/pages/sub/PeOrderPage.dart';
import 'package:hospital_app/utils/PageRouteUtils.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';

class PeCartPage extends StatefulWidget {
  PeCartPageState createState() => new PeCartPageState();
}

class PeCartPageState extends State<PeCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('体检购物车'),
        backgroundColor: GlobalConfig.topBarColor,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '您有一个待进行的体检订单',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    TextSpan(
                      text: '(点击查看)',
                      style: TextStyle(
                          color: GlobalConfig.textLinkColor, fontSize: 16),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          routePage(context, PeOrderPage());
                        },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 1,
            ),
            MaterialButton(
              padding: EdgeInsets.all(0),
              child: Container(
                width: Screen.width,
                padding: EdgeInsets.only(left: 20),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '创建新的体检订单 ',
                        style: TextStyle(color: Colors.grey[500], fontSize: 16),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(
                          Icons.add_circle,
                          color: GlobalConfig.bottomBarColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onPressed: () {
                routePage(context, PeCalendarPage());
              },
            ),
            Divider(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
