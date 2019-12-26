import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/widget/SubAppBtn.dart';

class ReportBtnsPage extends StatefulWidget {
  ReportBtnsPageState createState() => new ReportBtnsPageState();
}

class ReportBtnsPageState extends State<ReportBtnsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.topBarColor,),
      body: new Container(
        color: GlobalConfig.cardBackgroundColor,
        margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SubAppBtn(
                    title: '化验报告',
                    iconName: 'hybg',
                    backgroundColor: new Color(0xff00e19f),
                    routeView: Container(),
                  ),
                  SubAppBtn(
                    title: '体检报告',
                    iconName: 'tjbg',
                    backgroundColor: new Color(0xfff8ae00),
                    routeView: Container(),
                  ),
                  SubAppBtn(
                    title: '影像报告',
                    iconName: 'yxbg',
                    backgroundColor: new Color(0xff4cc4f9),
                    routeView: Container(),
                  ),
                  SubAppBtn(
                    title: '就医指南',
                    iconName: 'jyzn',
                    backgroundColor: new Color(0xffe289d9),
                    routeView: Container(),
                  ),
                ],
              ),
            ),
            new Container(
              padding: EdgeInsets.only(top: 20),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SubAppBtn(
                    title: '智能导诊',
                    iconName: 'zndz',
                    backgroundColor: new Color(0xff3597fa),
                    routeView: Container(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
