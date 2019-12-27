import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';

class SettingPage extends StatefulWidget {
  SettingPageState createState() => new SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  bool _push = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
        backgroundColor: GlobalConfig.topBarColor,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Icon(Icons.message),
                ),
                Expanded(
                  flex: 6,
                  child: Text('推送健康咨询'),
                ),
                Spacer(
                  flex: 6,
                ),
                Expanded(
                  flex: 3,
                  child: Switch(
                    value: _push,
                    onChanged: (newValue) {
                      setState(() {
                        _push = newValue;
                      });
                    },
                    activeTrackColor: GlobalConfig.topBarColor,
                    activeColor: GlobalConfig.bottomBarColor,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
            thickness: 1.5,
          ),
          FlatButton(
            padding: EdgeInsets.only(top: 0),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Icon(Icons.lock),
                ),
                Expanded(
                  flex: 6,
                  child: Text('修改登录密码'),
                ),
                Spacer(
                  flex: 11,
                ),
              ],
            ),
            onPressed: () {},
          ),
          Divider(
            height: 10,
            thickness: 1.5,
          ),
          FlatButton(
            padding: EdgeInsets.only(top: 0),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Icon(Icons.cancel),
                ),
                Expanded(
                  flex: 6,
                  child: Text('注销账户'),
                ),
                Spacer(
                  flex: 11,
                ),
              ],
            ),
            onPressed: () {},
          ),
          Divider(
            height: 10,
            thickness: 1.5,
          ),
          MaterialButton(
            minWidth: Screen.width - 30,
            height: 40,
            child: Text(
              '退出登录',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            color: GlobalConfig.bottomBarColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
