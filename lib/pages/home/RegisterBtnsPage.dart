import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/pages/sub/DoctorPage.dart';
import 'package:hospital_app/pages/sub/GuidePage.dart';
import 'package:hospital_app/pages/sub/RegisterOfficePage.dart';
import 'package:hospital_app/pages/sub/TextNaviPage.dart';
import 'package:hospital_app/utils/PageRouteUtils.dart';
import 'package:hospital_app/widget/SubAppBtn.dart';

class RegisterBtnsPage extends StatefulWidget {
  RegisterBtnsPageState createState() => new RegisterBtnsPageState();
}

class RegisterBtnsPageState extends State<RegisterBtnsPage> {
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
                    title: '预约挂号',
                    iconName: 'yygh',
                    backgroundColor: new Color(0xff00e19f),
                    buttonClick: () {
                      routePage(context, RegisterOfficePage());
                    },
                  ),
                  SubAppBtn(
                    title: '当日挂号',
                    iconName: 'drgh',
                    backgroundColor: new Color(0xfff8ae00),
                    buttonClick: null,
                  ),
                  SubAppBtn(
                    title: '医生介绍',
                    iconName: 'ysjs',
                    backgroundColor: new Color(0xff4cc4f9),
                    buttonClick: () {
                      routePage(context, DoctorPage());
                    },
                  ),
                  SubAppBtn(
                    title: '体检预约',
                    iconName: 'tjyy',
                    backgroundColor: new Color(0xffe289d9),
                    buttonClick: null,
                  ),
                ],
              ),
            ),
            new Container(
              padding: EdgeInsets.only(top: 20),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SubAppBtn(
                    title: '体检购物车',
                    iconName: 'tjgwc',
                    backgroundColor: new Color(0xff3597fa),
                    buttonClick: null,
                  ),
                  SubAppBtn(
                    title: '体检简介',
                    iconName: 'tjjj',
                    backgroundColor: new Color(0xffe289d9),
                    buttonClick: null,
                  ),
                  SubAppBtn(
                    title: '医院介绍',
                    iconName: 'yyjs',
                    backgroundColor: new Color(0xff05e4ad),
                    buttonClick: null,
                  ),
                  SubAppBtn(
                    title: '就医指南',
                    iconName: 'jyzn',
                    backgroundColor: new Color(0xfff8ad69),
                    buttonClick: () {
                      routePage(context, GuidePage());
                    },
                  ),
                ],
              ),
            ),
            new Container(
              padding: EdgeInsets.only(top: 20),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SubAppBtn(
                    title: '医院导航',
                    iconName: 'yydh',
                    backgroundColor: new Color(0xfff8ae00),
                    buttonClick: () {
                      routePage(context, TextNaviPage());
                    },
                  ),
                  SubAppBtn(
                    title: '智能导诊',
                    iconName: 'zndz',
                    backgroundColor: new Color(0xff4cc4f9),
                    buttonClick: null,
                  ),
                  SubAppBtn(
                    title: '患者评价',
                    iconName: 'hzpj',
                    backgroundColor: new Color(0xfff8ad69),
                    buttonClick: null,
                  ),
                  SubAppBtn(
                    title: '体检订单',
                    iconName: 'tjdd',
                    backgroundColor: new Color(0xff05e4ad),
                    buttonClick: null,
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
