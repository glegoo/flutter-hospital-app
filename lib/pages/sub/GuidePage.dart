import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';

class GuidePage extends StatefulWidget {
  GuidePageState createState() => new GuidePageState();
}

class GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.topBarColor,
        title: Text('就医指南'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(TestData.guide),
      ),
    );
  }
}
