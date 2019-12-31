import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';

class DoctorPage extends StatefulWidget {
  DoctorPageState createState() => new DoctorPageState();
}

class DoctorPageState extends State<DoctorPage> {
  var _doctors;

  @override
  void initState() {
    super.initState();
    _doctors = TestData.doctors;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Container(
            width: Screen.width - 80,
            padding: EdgeInsets.fromLTRB(0, 10, 50, 10),
            child: TextField(
              onSubmitted: (value) {
                setState(() {
                  if (value?.isEmpty ?? true) {
                    _doctors = TestData.doctors;
                  } else {
                    _doctors = _doctors
                        .where((d) => d['name'].toString().contains(value))
                        .toList();
                  }
                });
              },
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
        backgroundColor: GlobalConfig.topBarColor,
      ),
      body: ListView.separated(
        itemCount: _doctors.length,
        itemBuilder: _buildRow,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 1.5,
            height: 1.0,
            color: Colors.grey[300],
          );
        },
      ),
    );
  }

  Widget _buildRow(BuildContext context, int index) {
    Map info = _doctors[index];
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
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 15,
                          ),
                          alignment: PlaceholderAlignment.middle),
                      TextSpan(
                        text: '已认证',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            width: 280,
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
                    alignment: Alignment.topCenter,
                    child: Text(
                      '职称：${info['title']}\n科室：${info['office']}\n擅长：${info['sp']}',
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
}
