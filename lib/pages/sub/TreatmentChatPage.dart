import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';

class TreatmentChatPage extends StatefulWidget {
  TreatmentChatPageState createState() => new TreatmentChatPageState();
}

class TreatmentChatPageState extends State<TreatmentChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.topBarColor,
        title: Text('在线问诊'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              
            )
          ],
        ),
      ),
    );
  }
}
