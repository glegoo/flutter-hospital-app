import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';

class AboutPage extends StatefulWidget {
  AboutPageState createState() => new AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  bool _push = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于我们'),
        backgroundColor: GlobalConfig.topBarColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset(
                'static/images/hospital_icon.png',
                width: Screen.width / 2,
              ),
              Text(
                TestData.version,
                style: TextStyle(color: Colors.grey[500], fontSize: 20),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(TestData.aboutText),
          )
        ],
      ),
    );
  }
}
