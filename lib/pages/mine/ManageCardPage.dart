import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/pages/mine/AddCardPage.dart';
import 'package:hospital_app/utils/DialogUtils.dart';

class ManageCardPage extends StatefulWidget {
  ManageCardPageState createState() => new ManageCardPageState();
}

class ManageCardPageState extends State<ManageCardPage> {
  bool _select = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('就医卡管理'),
        backgroundColor: GlobalConfig.topBarColor,
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddCardPage(name: TestData.userName)));
              DialogUtils.show(context, '绑卡说明', TestData.bingCardTip);
            },
            padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
            child: Row(
              children: <Widget>[
                Image.asset('static/images/userIcon.png', height: 100),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: TestData.userName,
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.grey[700],
                              ),
                            ),
                            TextSpan(
                              text:
                                  '(${TestData.userAge}岁${TestData.userSex == 1 ? '♂' : '♀'})\n',
                              style: TextStyle(
                                color: GlobalConfig.topBarColor,
                                fontSize: 18,
                              ),
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                Icons.credit_card,
                                color: GlobalConfig.bottomBarColor,
                              ),
                            ),
                            TextSpan(
                              text: TestData.userID.toString(),
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 15),
                            ),
                            TextSpan(
                              text: '\n病历号：' + TestData.userHospitalId,
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Checkbox(
                  value: _select,
                  onChanged: (value) {
                    setState(() {
                      _select = value;
                    });
                  },
                  activeColor: GlobalConfig.topBarColor,
                )
              ],
            ),
          ),
          Divider(
            height: 0,
            thickness: 1.5,
          ),
          // FlatButton(
          //   onPressed: () {},
          //   padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
          //   child: Row(
          //     children: <Widget>[
          //       Container(
          //         width: 100,
          //         height: 100,
          //         decoration: BoxDecoration(
          //           color: Colors.grey[600],
          //           shape: BoxShape.circle,
          //         ),
          //         child: Icon(
          //           Icons.person_add,
          //           color: Colors.white,
          //           size: 60,
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(left: 20),
          //         child: Text(
          //           '点击绑定新卡',
          //           style: TextStyle(color: Colors.grey[700], fontSize: 18),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // Divider(
          //   height: 0,
          //   thickness: 1.5,
          // ),
        ],
      ),
    );
  }
}
