import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';

class PatientReviewPage extends StatefulWidget {
  PatientReviewPageState createState() => new PatientReviewPageState();
}

class PatientReviewPageState extends State<PatientReviewPage> {
  String _reviewType = '门诊评价';
  String _patient = TestData.userName;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('患者评价'),
        backgroundColor: GlobalConfig.topBarColor,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: ListView(
          children: <Widget>[
            Text('  评价类型'),
            Divider(),
            RadioListTile<String>(
              value: '门诊评价',
              title: Text('门诊评价'),
              groupValue: _reviewType,
              onChanged: (value) {
                setState(() {
                  _reviewType = value;
                });
              },
              activeColor: GlobalConfig.bottomBarColor,
            ),
            RadioListTile<String>(
              value: '住院评价',
              title: Text('住院评价'),
              groupValue: _reviewType,
              onChanged: (value) {
                setState(() {
                  _reviewType = value;
                });
              },
              activeColor: GlobalConfig.bottomBarColor,
            ),
            Text('  就诊人'),
            Divider(),
            RadioListTile<String>(
              value: TestData.userName,
              title: Text(TestData.userName),
              groupValue: _patient,
              onChanged: (value) {
                setState(() {
                  _reviewType = value;
                });
              },
              activeColor: GlobalConfig.bottomBarColor,
            ),
            Text('  评价'),
            Divider(),
            TextField(
              maxLines: 10,
            ),
            // Expanded(
            //   child: Container(
            //     height: double.maxFinite,
            //   ),
            // ),
            MaterialButton(
              minWidth: Screen.width - 30,
              height: 30,
              child: Text(
                '保存',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              color: GlobalConfig.bottomBarColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
