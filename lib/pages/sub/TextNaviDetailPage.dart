import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/pages/sub/ReportDetailPage.dart';
import 'package:hospital_app/utils/PageRouteUtils.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';

class TextNaviDetailPage extends StatefulWidget {
  TextNaviDetailPageState createState() => new TextNaviDetailPageState();
}

class TextNaviDetailPageState extends State<TextNaviDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.topBarColor,
        title: Text('楼层索引'),
      ),
      body: ListView.separated(
        itemCount: TestData.textNaviDetail.length,
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
    Map info = TestData.textNaviDetail[index];
    return FlatButton(
      padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 50,
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            alignment: Alignment.center,
            child: Text(
              info['floor'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            width: Screen.width - 120,
            child: Text(
              info['text'],
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
