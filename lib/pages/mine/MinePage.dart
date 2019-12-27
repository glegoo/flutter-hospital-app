import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/pages/mine/FamilyMemberPage.dart';
import 'package:hospital_app/pages/mine/SettingPage.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';

class MinePage extends StatefulWidget {
  String dataDay;

  MinePage({Key key, this.dataDay}) : super(key: key);

  MinePageState createState() => new MinePageState();
}

class MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Container(
          width: Screen.width,
          height: 250,
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
        _button('收藏的医生', Icons.local_hospital, 1, () {}),
        _button('家庭成员', Icons.person_add, 2, () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => FamilyMemberPage()));
        }),
        _button('绑定就诊卡', Icons.credit_card, 0, () {}),
        _button('订阅', Icons.book, 0, () {}),
        _button('常见问题', Icons.help, 0, () {}),
        _button('关于我们', Icons.info, 0, () {}),
        _button('设置', Icons.settings, 0, () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SettingPage()));}),
      ],
    );
  }

  Widget _button(String title, IconData icon, int count, Function pressed) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: FlatButton(
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Icon(icon),
            ),
            Expanded(
              flex: 3,
              child: Text(title),
            ),
            Spacer(
              flex: 3,
            ),
            count == 0
                ? Spacer(
                    flex: 2,
                  )
                : Expanded(
                    flex: 2,
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
              flex: 1,
            ),
          ],
        ),
        onPressed: pressed,
      ),
    );
  }
}
