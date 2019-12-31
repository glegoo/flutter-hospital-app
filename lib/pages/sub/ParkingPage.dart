import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';

class ParkingPage extends StatefulWidget {
  ParkingPageState createState() => new ParkingPageState();
}

class ParkingPageState extends State<ParkingPage> {
  bool _select = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('停车缴费'),
        backgroundColor: GlobalConfig.topBarColor,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
            child: Row(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: GlobalConfig.topBarColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'static/images/car_color.png',
                    scale: 2.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    '辽A 439PQ',
                    style: TextStyle(color: Colors.grey[700], fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: Checkbox(
                    value: _select,
                    onChanged: (value) {
                      setState(() {
                        _select = value;
                      });
                    },
                    activeColor: GlobalConfig.topBarColor,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
            thickness: 1.5,
          ),
          FlatButton(
            onPressed: () {
              _addCarDialog(context);
            },
            padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
            child: Row(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'static/images/car_grey.png',
                    scale: 2.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    '点击绑定新车辆',
                    style: TextStyle(color: Colors.grey[700], fontSize: 18),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 0,
            thickness: 1.5,
          ),
        ],
      ),
    );
  }

  _addCarDialog(BuildContext context) {
    showDialog<Null>(
        context: context, //BuildContext对象
        builder: (context) {
          return AlertDialog(
            //调用对话框
            title: Text('添加车辆'),
            content: Row(
              children: <Widget>[
                Text(
                  '辽A',
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width: Screen.width - 200,
                  child: TextField(),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text('取消'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              FlatButton(
                  child: Text('提交'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}
