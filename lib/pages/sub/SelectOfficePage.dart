import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/pages/sub/EncylopediaListPage.dart';
import 'package:hospital_app/pages/sub/RegisterCalendarPage.dart';
import 'package:hospital_app/utils/PageRouteUtils.dart';

enum SelectType { preRegister, register, encylopedia, onlineTreatment }

class SelectOfficePage extends StatefulWidget {
  final SelectType selectType;
  SelectOfficePage({Key key, this.selectType}) : super(key: key);
  SelectOfficePageState createState() => new SelectOfficePageState();
}

class SelectOfficePageState extends State<SelectOfficePage> {
  int _curIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> side = TestData.officeList[_curIndex]['list'] as List<String>;
    String title = '挂号';
    if (widget.selectType == SelectType.encylopedia) {
      title = '健康百科';
    } else if (widget.selectType == SelectType.onlineTreatment) {
      title = '在线问诊';
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.topBarColor,
        title: Text(title),
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[300],
              child: ListView.builder(
                itemCount: TestData.officeList.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildReportRow(
                    context,
                    index,
                    TestData.officeList
                        .map((o) => o['name'] as String)
                        .toList(),
                    true,
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: side.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildReportRow(
                  context,
                  index,
                  side,
                  false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportRow(
      BuildContext context, int index, List<String> list, bool left) {
    return FlatButton(
      color: (left && index == _curIndex) ? GlobalConfig.bottomBarColor : null,
      padding: EdgeInsets.fromLTRB(10, 12, 0, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          list[index],
          style: TextStyle(fontSize: 16),
        ),
      ),
      onPressed: () {
        if (left) {
          setState(() {
            _curIndex = index;
          });
        } else {
          routePage(
            context,
            widget.selectType == SelectType.encylopedia
                ? EncylopediaListPage()
                : RegisterCalendarPage(
                    selectType: widget.selectType,
                  ),
          );
        }
      },
    );
  }
}
