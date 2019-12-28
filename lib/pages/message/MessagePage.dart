import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/utils/TimeUtils.dart';

class MessagePage extends StatefulWidget {
  final String dataDay;

  MessagePage({Key key, this.dataDay}) : super(key: key);

  MessagePageState createState() => new MessagePageState();
}

class MessagePageState extends State<MessagePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.topBarColor,
        title: Text('消息'),
      ),
      body: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            title: FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text('全部'), Icon(Icons.arrow_drop_down)],
              ),
              onPressed: () {
                // _showAlertDialog();
              },
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          preferredSize: Size.fromHeight(40),
        ),
        body: ListView.separated(
          itemCount: TestData.messages.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // width: Screen.width - 40,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Container(
                child: Text(
                  GlobalConfig.appName +
                      '【' +
                      chineseDateTimeFormat(TestData.messages[index]['time']) +
                      '】\n' +
                      TestData.messages[index]['text'],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 1.5,
              height: 1.0,
              color: Colors.grey[300],
            );
          },
        ),
        // body: Column(
        //   children: <Widget>[],
        // ),
      ),
    );
  }
}
