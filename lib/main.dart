import 'package:flutter/material.dart';
import 'package:hospital_app/pages/App.dart';
import 'common/GlobalConfig.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: GlobalConfig.appName,
      theme: new ThemeData(
        primarySwatch: GlobalConfig.colorPrimary,
      ),
      home: new AppPage(),
    );
  }
}
