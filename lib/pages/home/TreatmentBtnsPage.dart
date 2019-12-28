import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/pages/sub/DoctorPage.dart';
import 'package:hospital_app/utils/PageRouteUtils.dart';
import 'package:hospital_app/widget/SubAppBtn.dart';

class TreatmentBtnsPage extends StatefulWidget {
  TreatmentBtnsPageState createState() => new TreatmentBtnsPageState();
}

class TreatmentBtnsPageState extends State<TreatmentBtnsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.topBarColor,
      ),
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
                    title: '医院介绍',
                    iconName: 'yyjs',
                    backgroundColor: new Color(0xff00e19f),
                    buttonClick: () {
                      routePage(context, Container());
                    },
                  ),
                  SubAppBtn(
                    title: '医生介绍',
                    iconName: 'ysjs',
                    backgroundColor: new Color(0xfff8ae00),
                    buttonClick: () {
                      routePage(context, DoctorPage());
                    },
                  ),
                  SubAppBtn(
                    title: '体检简介',
                    iconName: 'tjjj',
                    backgroundColor: new Color(0xff4cc4f9),
                    buttonClick: () {
                      routePage(context, Container());
                    },
                  ),
                  SubAppBtn(
                    title: '就医指南',
                    iconName: 'jyzn',
                    backgroundColor: new Color(0xffe289d9),
                    buttonClick: () {
                      routePage(context, Container());
                    },
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
                    title: '健康百科',
                    iconName: 'jkbk',
                    backgroundColor: new Color(0xff3597fa),
                    buttonClick: () {
                      routePage(context, Container());
                    },
                  ),
                  SubAppBtn(
                    title: '用药处方',
                    iconName: 'yycf',
                    backgroundColor: new Color(0xffe289d9),
                    buttonClick: () {
                      routePage(context, Container());
                    },
                  ),
                  SubAppBtn(
                    title: '复查计划',
                    iconName: 'fcjh',
                    backgroundColor: new Color(0xff05e4ad),
                    buttonClick: () {
                      routePage(context, Container());
                    },
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
