import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';

class AddCardPage extends StatefulWidget {
  final String name;
  AddCardPage({Key key, this.name}) : super(key: key);
  AddCardPageState createState() => new AddCardPageState();
}

class AddCardPageState extends State<AddCardPage> {
  bool _select = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('绑卡 - ${widget.name}'),
        backgroundColor: GlobalConfig.topBarColor,
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
            child: Row(
              children: <Widget>[
                Image.asset('static/images/id_card.png', height: 70),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    '病历号：${TestData.userHospitalId}\n手机号：${TestData.userPhone}',
                    style: TextStyle(color: Colors.grey[700], fontSize: 13),
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
          FlatButton(
            onPressed: () {},
            padding: EdgeInsets.fromLTRB(15, 20, 0, 20),
            child: Row(
              children: <Widget>[
                Container(
                  width: 112,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    '点击绑定新卡',
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
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
}
