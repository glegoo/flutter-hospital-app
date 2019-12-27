import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';

class SubscribePage extends StatefulWidget {
  SubscribePageState createState() => new SubscribePageState();
}

class SubscribePageState extends State<SubscribePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('订阅'),
        backgroundColor: GlobalConfig.topBarColor,
        actions: <Widget>[
          Container(
            child: RichText(
              text: TextSpan(
                  text: '文章收藏',
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style:
                      TextStyle(color: Colors.lightGreenAccent, fontSize: 16)),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 20),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          '暂时没有内容',
          style: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
