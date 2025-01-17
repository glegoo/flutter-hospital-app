import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:photo_view/photo_view.dart';

class ReportDetailPage extends StatefulWidget {
  final String imageName;
  ReportDetailPage({Key key, this.imageName}) : super(key: key);
  ReportDetailPageState createState() => new ReportDetailPageState();
}

class ReportDetailPageState extends State<ReportDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.topBarColor,
        title: Text('${TestData.userName} 报告单'),
      ),
      body: Container(
        child: PhotoView(
          imageProvider: AssetImage('static/images/${widget.imageName}.png'),
          backgroundDecoration:
              BoxDecoration(color: GlobalConfig.backgroundColor),
        ),
      ),
    );
  }
}
