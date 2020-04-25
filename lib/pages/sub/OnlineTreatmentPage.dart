import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/pages/sub/TreatmentChatPage.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';
import 'package:image_picker/image_picker.dart';

class OnlineTreatmentPage extends StatefulWidget {
  final int doctorId;
  OnlineTreatmentPage({Key key, this.doctorId}) : super(key: key);
  OnlineTreatmentPageState createState() => new OnlineTreatmentPageState();
}

class OnlineTreatmentPageState extends State<OnlineTreatmentPage> {
  final _key1 = GlobalKey<FormState>();
  final _key2 = GlobalKey<FormState>();
  var _step = 0;
  var _imgPath;
  String _name;
  String _phone;
  String _height;
  String _weight;
  String _family;
  String _guomin;
  String _bingqing;
  String _bangzhu;

  @override
  void initState() {
    super.initState();
  }

  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
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
                            onSaved: (val) {
                              _name = val;
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
                            onSaved: (val) {
                              _phone = val;
                            },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: '身高(cm)',
                              hintText: '选填',
                            ),
                            onSaved: (val) {
                              _height = val;
                            },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: '体重(kg)',
                              hintText: '选填',
                            ),
                            onSaved: (val) {
                              _weight = val;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: '家族病史',
                              hintText: '选填',
                            ),
                            onSaved: (val) {
                              _family = val;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              labelText: '过敏史',
                              hintText: '选填',
                            ),
                            onSaved: (val) {
                              _guomin = val;
                            },
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            child: FlatButton(
                              onPressed: () {
                                if (_key1.currentState.validate()) {
                                  _key1.currentState.save();
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
                                return '请输入病情';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              _bingqing = val;
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
                            onSaved: (val) {
                              _bangzhu = val;
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
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('添加图片（患处、检查报告等）'),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.centerLeft,
                            child: FlatButton(
                              onPressed: _openGallery,
                              color: GlobalConfig.topBarColor,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Text(
                                '选择照片',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            child: FlatButton(
                              onPressed: () {
                                if (_key2.currentState.validate()) {
                                  _key2.currentState.save();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => TreatmentChatPage(
                                            name: _name,
                                            height: _height,
                                            weight: _weight,
                                            phone: _phone,
                                            guomin: _guomin,
                                            family: _family,
                                            bingqing: _bingqing,
                                            bangzhu: _bangzhu,
                                          )));
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
