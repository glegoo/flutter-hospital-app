import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/pages/sub/TreatmentChatPage.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';

class OnlineTreatmentPage extends StatefulWidget {
  final int doctorId;
  OnlineTreatmentPage({Key key, this.doctorId}) : super(key: key);
  OnlineTreatmentPageState createState() => new OnlineTreatmentPageState();
}

class OnlineTreatmentPageState extends State<OnlineTreatmentPage> {
  final _key1 = GlobalKey<FormState>();
  final _key2 = GlobalKey<FormState>();
  var _step = 0;
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildRow(context),
              Divider(
                color: GlobalConfig.backgroundColor,
                height: 20,
                thickness: 15,
              ),
              _step == 0
                  ? Form(
                      key: _key1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                labelText: '咨询人',
                                hintText: '请输入真实姓名'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return '请输入姓名';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: '电话',
                              hintText: '必填',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return '请输入电话';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: '身高(cm)',
                              hintText: '选填',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: '体重(kg)',
                              hintText: '选填',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: '家族病史',
                              hintText: '选填',
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: '过敏史',
                              hintText: '选填',
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            child: FlatButton(
                              onPressed: () {
                                if (_key1.currentState.validate()) {
                                  setState(() {
                                    _step = 1;
                                  });
                                }
                              },
                              color: GlobalConfig.topBarColor,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Text(
                                '下一步',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Form(
                      key: _key2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            minLines: 4,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                labelText: '病情描述（必填）',
                                hintText: '请详细描述您的病情症状，以便医生确认接诊'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return '请输入姓名';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('本次想获得的帮助'),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            minLines: 2,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                labelText: '帮助一（必填）',
                                hintText: '想获得什么帮助'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return '必填';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            minLines: 2,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                labelText: '帮助二',
                                hintText: '想获得什么帮助'),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            minLines: 2,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                labelText: '帮助三',
                                hintText: '想获得什么帮助'),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            minLines: 2,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                labelText: '已就诊医院、科室（选填）',
                                hintText: ''),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            child: FlatButton(
                              onPressed: () {
                                if (_key2.currentState.validate()) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          TreatmentChatPage()));
                                }
                              },
                              color: GlobalConfig.topBarColor,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Text(
                                '提交',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
            ],
          ),
        ));
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
}
