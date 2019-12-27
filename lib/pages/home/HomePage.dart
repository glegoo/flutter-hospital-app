import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hospital_app/pages/home/PaymentBtnsPage.dart';
import 'package:hospital_app/pages/home/RegisterBtnsPage.dart';
import 'package:hospital_app/pages/home/ReportBtnsPage.dart';
import 'package:hospital_app/pages/home/TreatmentBtnsPage.dart';
import 'package:hospital_app/pages/mine/AboutPage.dart';

class HomePage extends StatefulWidget {
  String dataDay;

  HomePage({Key key, this.dataDay}) : super(key: key);

  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: GlobalConfig.backgroundColor,
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: GlobalConfig.topBarColor,
          // leading: new IconButton(
          //   icon: new Icon(Icons.info),
          //   onPressed: _listIconPressed,
          // ),
          title: new Text(GlobalConfig.appName),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.camera_alt),
              onPressed: _cameraIconPressed,
            ),
          ],
        ),
        body: new Container(
          child: new ListView(
            children: <Widget>[
              new Container(
                height: 200.0,
                child: new Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.asset(
                      "static/images/home_swiper_1.png",
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: 3,
                  pagination: new SwiperPagination(),
                ),
              ),
              new Container(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: GlobalConfig.cardBackgroundColor,
                  // boxShadow 是一个数组，可设置多个 BoxShadow
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400],
                      // 偏移量 x和y 都是5
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Container(
                            width: MediaQuery.of(context).size.width / 2 - 10,
                            height:
                                (MediaQuery.of(context).size.width / 2 - 10) *
                                    0.6,
                            child: new FlatButton(
                              child: Image.asset(
                                  "static/images/btn_home_green.png"),
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RegisterBtnsPage()));
                              },
                            ),
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width / 2 - 10,
                            height:
                                (MediaQuery.of(context).size.width / 2 - 10) *
                                    0.6,
                            child: new FlatButton(
                              child: Image.asset(
                                  "static/images/btn_home_blue.png"),
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PaymentBtnsPage()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Container(
                            width: MediaQuery.of(context).size.width / 2 - 10,
                            height:
                                (MediaQuery.of(context).size.width / 2 - 10) *
                                    0.6,
                            child: new FlatButton(
                              child: Image.asset(
                                  "static/images/btn_home_yellow.png"),
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TreatmentBtnsPage()));
                              },
                            ),
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width / 2 - 10,
                            height:
                                (MediaQuery.of(context).size.width / 2 - 10) *
                                    0.6,
                            child: new FlatButton(
                              child: Image.asset(
                                  "static/images/btn_home_pink.png"),
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ReportBtnsPage()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                color: GlobalConfig.cardBackgroundColor,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: new Column(
                  children: <Widget>[
                    new Align(
                      alignment: Alignment.centerLeft,
                      child: new Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: new Text('收藏的医生'),
                      ),
                    ),
                    new Divider(
                      height: 10.0,
                      indent: 0.0,
                      color: Colors.grey[400],
                    ),
                    new Container(
                      height: 100,
                      child: new Align(
                        alignment: Alignment.center,
                        child: new RichText(
                          text: new TextSpan(
                            text: '暂无收藏医生。可在',
                            style: new TextStyle(
                              color: GlobalConfig.textDescColor,
                            ),
                            children: <TextSpan>[
                              new TextSpan(
                                text: ' 医生介绍 ',
                                style: new TextStyle(
                                  color: GlobalConfig.textLinkColor,
                                ),
                              ),
                              new TextSpan(
                                text: '中收藏医生',
                                style: new TextStyle(
                                  color: GlobalConfig.textDescColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    new Divider(
                      height: 10.0,
                      indent: 0.0,
                      color: Colors.grey[400],
                    ),
                    new Align(
                      alignment: Alignment.centerLeft,
                      child: new Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: new Text('就诊提醒'),
                      ),
                    ),
                    new Divider(
                      height: 10.0,
                      indent: 0.0,
                      color: Colors.grey[400],
                    ),
                    new Container(
                      height: 100,
                      child: new Align(
                        alignment: Alignment.center,
                        child: new Text('暂无就诊提醒'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listIconPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AboutPage()));
  }

  void _cameraIconPressed() {}
}
