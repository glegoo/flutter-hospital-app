import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/pages/sub/EncylopediaPage.dart';
import 'package:hospital_app/utils/PageRouteUtils.dart';
import 'package:hospital_app/utils/TimeUtils.dart';

class EncylopediaListPage extends StatefulWidget {
  EncylopediaListPageState createState() => new EncylopediaListPageState();
}

class EncylopediaListPageState extends State<EncylopediaListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.topBarColor,
      ),
      body: Container(
        color: Colors.grey[300],
        child: ListView.separated(
          itemCount: 2,
          itemBuilder: _buildRow,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 1,
              height: 1.0,
              color: Colors.grey[300],
              indent: 20,
              endIndent: 20,
            );
          },
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, int index) {
    return FlatButton(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      onPressed: () {
        routePage(context, EncylopediaPage());
      },
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text('高血压病的健康指导'),
            SizedBox(
              height: 15,
            ),
            Text(
              chineseDateTimeFormat(
                DateTime(2019, 12, 12, 12, 12),
              ),
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
