import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/utils/TimeUtils.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';

class MessagePage extends StatefulWidget {
  String dataDay;

  MessagePage({Key key, this.dataDay}) : super(key: key);

  MessagePageState createState() => new MessagePageState();
}

class MessagePageState extends State<MessagePage> {
  var _messages = [
    {
      'time': DateTime(2019, 6, 1, 14, 12),
      'text': '您有2份体检报告，请前往2楼2016诊室请医生验看。',
      'type': 'pe'
    },
    {
      'time': DateTime(2019, 6, 1, 15, 1),
      'text': '您有1份处方，3种药品，请就近交费后前往1楼左侧药局取药。',
      'type': 'medicine'
    },
  ];

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
                _showAlertDialog();
              },
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          preferredSize: Size.fromHeight(40),
        ),
        body: ListView.separated(
          itemCount: _messages.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // width: Screen.width - 40,
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Container(
                child: Text(
                  GlobalConfig.appName +
                      '【' +
                      chineseDateTimeFormat(_messages[index]['time']) +
                      '】\n' +
                      _messages[index]['text'],
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

  _showAlertDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            // title: Text('我是个标题...嗯，标题..'),
            // titleTextStyle: TextStyle(color: Colors.purple), // 标题文字样式
            // content: Text(r'我是内容\(^o^)/~, 我是内容\(^o^)/~, 我是内容\(^o^)/~'),
            // contentTextStyle: TextStyle(color: Colors.green), // 内容文字样式
            // backgroundColor: Colors.white,
            // elevation: 8.0, // 投影的阴影高度
            // semanticLabel: 'Label', // 这个用于无障碍下弹出 dialog 的提示
            // shape: Border.all(),
            // // dialog 的操作按钮，actions 的个数尽量控制不要过多，否则会溢出 `Overflow`
            // actions: <Widget>[
            //   // 点击增加显示的值
            //   FlatButton(onPressed: () {}, child: Text('点我增加')),
            //   // 点击减少显示的值
            //   FlatButton(onPressed: () {}, child: Text('点我减少')),
            //   // 点击关闭 dialog，需要通过 Navigator 进行操作
            //   FlatButton(
            //       onPressed: () => Navigator.pop(context),
            //       child: Text('你点我试试.')),
            // ],
            ));
  }
}
