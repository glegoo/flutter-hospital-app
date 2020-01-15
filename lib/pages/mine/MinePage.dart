import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/pages/mine/AboutPage.dart';
import 'package:hospital_app/pages/mine/FamilyMemberPage.dart';
import 'package:hospital_app/pages/mine/ManageCardPage.dart';
import 'package:hospital_app/pages/mine/QuestionPage.dart';
import 'package:hospital_app/pages/mine/SettingPage.dart';
import 'package:hospital_app/pages/mine/SubscribePage.dart';
import 'package:hospital_app/pages/sub/DoctorPage.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';

class MinePage extends StatefulWidget {
  MinePageState createState() => new MinePageState();
}

class MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: Screen.width,
          height: 240,
          decoration: BoxDecoration(color: GlobalConfig.topBarColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Image.asset(
                  'static/images/userIcon.png',
                  height: 100,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  '手机用户' + TestData.userPhone.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            // padding: EdgeInsets.only(top: 0),
            children: <Widget>[
              _button(
                  '收藏的医生',
                  Icons.local_hospital,
                  1,
                  DoctorPage(
                    favorate: true,
                  )),
              _button('家庭成员', Icons.group_add, 2, FamilyMemberPage()),
              _button('绑定就诊卡', Icons.credit_card, 0, ManageCardPage()),
              _button('订阅', Icons.book, 0, SubscribePage()),
              _button('常见问题', Icons.help, 0, QuestionPage()),
              _button('关于我们', Icons.info, 0, AboutPage()),
              _button('设置', Icons.settings, 0, SettingPage())
            ],
          ),
        ),
      ],
    );
  }

  Widget _button(String title, IconData icon, int count, Widget page) {
    return Container(
      child: FlatButton(
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Icon(icon),
            ),
            Expanded(
              flex: 6,
              child: Text(
                title,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Spacer(
              flex: 6,
            ),
            count == 0
                ? Spacer(
                    flex: 4,
                  )
                : Expanded(
                    flex: 4,
                    child: Container(
                      height: 20,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          count.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: GlobalConfig.bottomBarColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
        onPressed: () {
          if (page != null) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => page));
          }
        },
      ),
    );
  }
}
