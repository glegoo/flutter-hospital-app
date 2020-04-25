import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';

class TreatmentChatPage extends StatefulWidget {
  final String name;
  final String phone;
  final String height;
  final String weight;
  final String family;
  final String guomin;
  final String bingqing;
  final String bangzhu;

  const TreatmentChatPage(
      {Key key,
      this.name,
      this.height,
      this.weight,
      this.family,
      this.guomin,
      this.bingqing,
      this.bangzhu,
      this.phone})
      : super(key: key);
  TreatmentChatPageState createState() => new TreatmentChatPageState();
}

class TreatmentChatPageState extends State<TreatmentChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: GlobalConfig.topBarColor,
          title: Text('在线问诊'),
        ),
        persistentFooterButtons: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            width: Screen.width,
            height: 30,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('还剩4次提问机会'),
                FlatButton(
                  onPressed: () {},
                  color: GlobalConfig.topBarColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Text(
                    '补充提问',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          )
        ],
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: Screen.width - 20,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Text(
                                '在线咨询',
                                style: TextStyle(
                                  color: GlobalConfig.topBarColor,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                widget.name + ' ' + widget.phone,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 4,
                          height: 0,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Text(
                                  '基本信息',
                                  style: TextStyle(
                                    color: GlobalConfig.topBarColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 0,
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text('身高(cm)：' +
                                    (widget.height.isEmpty
                                        ? '0'
                                        : widget.height)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text('体重(kg)：' +
                                    (widget.weight.isEmpty
                                        ? '0'
                                        : widget.weight)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text('家族病史：' +
                                    (widget.family.isEmpty
                                        ? '暂无'
                                        : widget.family)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text('过敏史：' +
                                    (widget.guomin.isEmpty
                                        ? '暂无'
                                        : widget.guomin)),
                              ),
                              Divider(
                                thickness: 2,
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  '病情描述',
                                  style: TextStyle(
                                    color: GlobalConfig.topBarColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 0,
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text((widget.bingqing)),
                              ),
                              Divider(
                                thickness: 2,
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  '想获得的帮助',
                                  style: TextStyle(
                                    color: GlobalConfig.topBarColor,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 0,
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                                child: Text((widget.bangzhu)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: Screen.width - 20,
                    decoration: new BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          '温馨提示：您可以继续补充咨询内容，以便医生了解情况，在线咨询不代表面诊，医生建议仅供参考。医生利用工作空闲时间回复，请耐心等待。如果医生12小时内为回复，系统将自动关闭，咨询费用会在7个工作日内按支付路径返回。'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
