import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';

class FamilyMemberPage extends StatefulWidget {
  FamilyMemberPageState createState() => new FamilyMemberPageState();
}

class FamilyMemberPageState extends State<FamilyMemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('家庭成员'),
        backgroundColor: GlobalConfig.topBarColor,
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              '已添加2位家庭成员，还可以添加7位',
              style: TextStyle(color: GlobalConfig.topBarColor),
            ),
          ),
          Divider(
            thickness: 1.5,
            height: 1,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: TestData.userName,
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  TextSpan(
                      text: '(点击编辑)',
                      style: TextStyle(color: GlobalConfig.textLinkColor)),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1.5,
            height: 1,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: TestData.familyName,
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  TextSpan(
                      text: '(点击编辑)',
                      style: TextStyle(color: GlobalConfig.textLinkColor)),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1.5,
            height: 1,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: FlatButton(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add_circle,
                    color: GlobalConfig.topBarColor,
                  ),
                  Text('点击填加家庭成员')
                ],
              ),
              onPressed: () {},
            ),
          ),
          Divider(
            thickness: 1.5,
            height: 1,
          ),
        ],
      ),
    );
  }
}
