import 'package:flutter/material.dart';
import 'package:hospital_app/common/GlobalConfig.dart';
import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';
import 'package:hospital_app/common/TestData.dart';
import 'package:hospital_app/utils/ScreenUtils.dart';

class RegisterCalendarPage extends StatefulWidget {
  RegisterCalendarPageState createState() => new RegisterCalendarPageState();
}

class RegisterCalendarPageState extends State<RegisterCalendarPage> {
  CalendarController controller;
  ValueNotifier<String> text;
  bool _showList = false;

  @override
  void initState() {
    var date = DateTime.now();
    date = date.add(Duration(days: 1));
    var end = date.add(Duration(days: 13));
    // TODO: implement initState
    super.initState();
    controller = new CalendarController(
      minYear: date.year,
      minYearMonth: date.month,
      // minSelectDay: date.day,
      maxYear: end.year,
      maxYearMonth: end.month,
      // maxSelectDay: end.day,
      showMode: CalendarConstants.MODE_SHOW_ONLY_WEEK,
      // selectDateModel: DateModel.fromDateTime(date),
    );
    controller.addOnCalendarSelectListener((listener) {
      setState(() {
        _showList = controller.getSingleSelectCalendar().day % 2 == 0;
      });
    });
    controller.addMonthChangeListener(
      (year, month) {
        text.value = "$month月";
      },
    );
    text = new ValueNotifier("${date.month}月");
  }

  @override
  Widget build(BuildContext context) {
    CalendarViewWidget calendar = CalendarViewWidget(
      calendarController: controller,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalConfig.topBarColor,
        title: Text('预约时间'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: ValueListenableBuilder(
                valueListenable: text,
                builder: (context, value, child) {
                  return new Text(text.value);
                },
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: calendar,
          ),
          _showList
              ? Expanded(
                  flex: 16,
                  child: ListView.separated(
                    itemCount: TestData.doctors.length,
                    itemBuilder: _buildRow,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        thickness: 1.5,
                        height: 1.0,
                        color: Colors.grey[300],
                      );
                    },
                  ),
                )
              : Spacer(
                  flex: 16,
                ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, int index) {
    Map info = TestData.doctors[index];
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
                      fontSize: 18,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '挂号级别：${info['title']}\n出诊科室：${info['office']}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
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
