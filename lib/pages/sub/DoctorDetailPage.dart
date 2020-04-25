import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';

import 'OnlineTreatmentPage.dart';

class DoctorDetailPage extends StatefulWidget {
  final int doctorId;
  final bool onlineTreatment;
  DoctorDetailPage({Key key, this.doctorId, this.onlineTreatment})
      : super(key: key);
  DoctorDetailPageState createState() => new DoctorDetailPageState();
}

class DoctorDetailPageState extends State<DoctorDetailPage> {
  bool _favorited = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('医生介绍'),
        backgroundColor: GlobalConfig.topBarColor,
      ),
      body: Column(
        children: <Widget>[
          _buildRow(context),
          Divider(
            color: GlobalConfig.backgroundColor,
            height: 20,
            thickness: 15,
          ),
          Container(
            height: Screen.height - 300,
            padding: EdgeInsets.only(),
            child: ListView(
              children: <Widget>[
                _buildPart(
                  Icons.date_range,
                  '出诊日期',
                  '暂无医生排班信息',
                ),
                Divider(
                  indent: 25,
                  thickness: 2,
                ),
                _buildPart(
                  Icons.local_hospital,
                  '擅长',
                  TestData.doctors[widget.doctorId]['sp'],
                ),
                Divider(
                  indent: 25,
                  thickness: 2,
                ),
                _buildPart(
                  Icons.local_hospital,
                  '简介',
                  TestData.doctors[widget.doctorId]['desc'],
                ),
              ],
            ),
          ),
          widget.onlineTreatment
              ? Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        '￥0.00/次',
                        style: TextStyle(fontSize: 20),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OnlineTreatmentPage(
                                  doctorId: widget.doctorId)));
                        },
                        color: GlobalConfig.topBarColor,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text(
                          '立即问诊',
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _favorited
                          ? Container(
                              width: Screen.width / 2 - 20,
                              child: FlatButton.icon(
                                color: Colors.red[100],
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                label: Text(
                                  '已收藏',
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _favorited = !_favorited;
                                  });
                                },
                              ),
                            )
                          : Container(
                              width: Screen.width / 2 - 20,
                              child: FlatButton.icon(
                                color: Colors.red,
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  '收藏',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _favorited = !_favorited;
                                  });
                                },
                              ),
                            ),
                      Container(
                        width: Screen.width / 2 - 20,
                        child: FlatButton(
                          color: GlobalConfig.bottomBarColor,
                          child: Text(
                            '挂号',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context) {
    Map info = TestData.doctors[widget.doctorId];
    return FlatButton(
      onPressed: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => AddCardPage(name: TestData.userName)));
        // DialogUtils.show(context, '绑卡说明', TestData.bingCardTip);
      },
      padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  'static/photos/${info['photo']}.jpg',
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            width: Screen.width - 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    info['name'],
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '职称：${info['title']}\n科室：${info['office']}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPart(IconData icon, String title, String desc) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                    child: Icon(
                      icon,
                      size: 26,
                    ),
                    alignment: PlaceholderAlignment.bottom),
                TextSpan(text: '\s'),
                TextSpan(
                  text: title,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 21,
                  ),
                ),
              ],
            ),
          ),
          Text(
            desc,
          ),
        ],
      ),
    );
  }
}
