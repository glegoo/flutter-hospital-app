import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:hospital_app/pages/message/MessagePage.dart';
import 'package:hospital_app/pages/register/RegisterPage.dart';

import 'home/HomePage.dart';
import 'register/RegisterPage.dart';
import 'message/MessagePage.dart';
import 'mine/MinePage.dart';

class AppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppPageState();
}

class AppPageState extends State<AppPage> {
  int page = 0;
  String title = GlobalConfig.homeTab;
  PageController pageController;

  //定义底部导航项目
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text(GlobalConfig.homeTab),
        backgroundColor: GlobalConfig.colorPrimary),
    new BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        title: Text(GlobalConfig.messageTab),
        backgroundColor: GlobalConfig.colorPrimary),
    new BottomNavigationBarItem(
        icon: Icon(Icons.insert_drive_file),
        title: Text(GlobalConfig.registerTab),
        backgroundColor: GlobalConfig.colorPrimary),
    new BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text(GlobalConfig.mineTab),
        backgroundColor: GlobalConfig.colorPrimary),
  ];

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: new ThemeData(primaryColor: GlobalConfig.colorPrimary),
      home: Scaffold(
        body: new PageView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomePage(),
            MessagePage(),
            RegisterPage(),
            MinePage()
          ],
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: new BottomNavigationBar(
            items: _bottomTabs,
            currentIndex: page,
            backgroundColor: GlobalConfig.bottomBarColor,
            fixedColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            onTap: onTap),
      ),
    );
  }

  void onTap(int index) {
    // pageController.animateToPage(index,
    //     duration: const Duration(milliseconds: 300), curve: Curves.ease);
    pageController.jumpToPage(index);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
      switch (page) {
        case 0:
          title = GlobalConfig.homeTab;
          break;
        case 1:
          title = GlobalConfig.messageTab;
          break;
        case 2:
          title = GlobalConfig.registerTab;
          break;
        case 3:
          title = GlobalConfig.mineTab;
          break;
      }
    });
  }
}
