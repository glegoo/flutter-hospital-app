import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';

class EncylopediaPage extends StatefulWidget {
  EncylopediaPageState createState() => new EncylopediaPageState();
}

class EncylopediaPageState extends State<EncylopediaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.topBarColor,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView(
          children: <Widget>[
            Image.asset("static/images/encylopedia_01.jpg"),
            Image.asset("static/images/encylopedia_02.jpg"),
          ],
        ),
      ),
    );
  }
}
