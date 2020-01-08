import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';

class MapNaviPage extends StatefulWidget {
  MapNaviPageState createState() => new MapNaviPageState();
}

class MapNaviPageState extends State<MapNaviPage> {
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
                contentPadding: EdgeInsets.only(left: 10, top: 10),
                fillColor: Colors.white,
                filled: true,
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: '输入您要前往的科室......',
              ),
            ),
          ),
        ],
        backgroundColor: GlobalConfig.topBarColor,
      ),
      body: Container(),
    );
  }
}
