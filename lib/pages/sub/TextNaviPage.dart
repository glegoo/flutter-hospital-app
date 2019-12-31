import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/pages/sub/ReportDetailPage.dart';
import 'package:hospital_app/pages/sub/TextNaviDetailPage.dart';
import 'package:hospital_app/utils/PageRouteUtils.dart';

class TextNaviPage extends StatefulWidget {
  TextNaviPageState createState() => new TextNaviPageState();
}

class TextNaviPageState extends State<TextNaviPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.topBarColor,
        title: Text('医院导航'),
      ),
      body: ListView.separated(
        itemCount: TestData.textNaviMenu.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildReportRow(context, index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 0,
            color: Colors.grey[300],
          );
        },
      ),
    );
  }

  Widget _buildReportRow(BuildContext context, int index) {
    return FlatButton(
      padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          TestData.textNaviMenu[index],
          style: TextStyle(fontSize: 20),
        ),
      ),
      onPressed: () {
        _openReport(context, index);
      },
    );
  }

  void _openReport(BuildContext context, int index) {
    routePage(context, TextNaviDetailPage());
  }
}
