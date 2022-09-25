import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:intl/intl.dart';
import 'package:matcher/matcher.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:web_vue/constants.dart';
import 'package:web_vue/responsive/tablet_scaffold.dart';
import 'package:web_vue/util/my_box.dart';
import 'package:web_vue/util/my_title.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:async';

import 'desktop_scaffold.dart';

class mobileScaffold extends StatefulWidget {
  const mobileScaffold({Key? key}) : super(key: key);

  @override
  State<mobileScaffold> createState() => _mobileScaffoldState();
}

class _mobileScaffoldState extends State<mobileScaffold> {
  @override
  //カンレンダー用の変数
  String _subjectText = '',
      _startTimeText = '',
      _endTimeText = '',
      _dateText = '',
      _timeDetails = '';

  // （1） 入力された日付変数
  DateTime _inputDate = DateTime.now();

  Future _openSample1(BuildContext context) async {
    // （3） ダイアログを表示する
    final DateTime? _date = await showDatePicker(
      context: context,
      // （4） 処理指定日付
      initialDate: DateTime.now(),
      // （5） 指定できる日付範囲
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2022, 12, 31),
    );
    // （6） 選択された場合に、値を設定する
    if (_date != null) {
      setState(() {
        _inputDate = _date;
      });
    }
  }

  Map<DateTime, List> _eventsList = {}; //追記

  DateTime _focused = DateTime.now();
  DateTime? _selected;

  //--追記--------------------------------------------------------------

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void initState() {
    super.initState();

    _selected = _focused;
    _eventsList = {
      DateTime.now().subtract(Duration(days: 2)): ['Test A', 'Test B'],
      DateTime.now(): ['Test C', 'Test D', 'Test E', 'Test F'],
    };

    /// Timer.periodic は繰り返し実行する時に使うメソッド
    Timer.periodic(Duration(seconds: 1), _onTimer);
  }

  String _time = '';

  void _onTimer(Timer timer) {
    /// 現在時刻を取得する
    var now = DateTime.now();

    /// 「時:分:秒」表記に文字列を変換するdateFormatを宣言する
    var dateFormat = DateFormat('yyyy/MM/dd HH:mm:ss');

    /// nowをdateFormatでstringに変換する
    var timeString = dateFormat.format(now);
    setState(() => {_time = timeString});
  }

  Color _textColor(DateTime day) {
    const _defaultTextColor = Colors.black87;

    if (day.weekday == DateTime.sunday) {
      return Colors.red;
    }
    if (day.weekday == DateTime.saturday) {
      return Colors.blue[600]!;
    }
    return _defaultTextColor;
  }

  var _selectedValue = 'Hawaii';
  var _usStates = ["管理者", "生徒", "ユーザー"];
  var _appColer = Colors.blue;

  Widget build(BuildContext context) {
    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List getEvent(DateTime day) {
      return _events[day] ?? [];
    }

    return Scaffold(
        // ignore: prefer_const_constructors
        appBar: MyAppBer(titleName: 'D A S H B O R D'),
        backgroundColor: myDefalutBackground,
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey, //色
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(1, 1),
                            ),
                          ],
                          color: Colors.grey[100],
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                  color: Colors.blue,
                                  child: Row(
                                    children: [
                                      Text(
                                        'タイムレコーダー',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.white),
                                      ),
                                    ],
                                  )),
                              Card(
                                child: Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      _time,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 30),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        print(_time);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
                                        onPrimary: Colors.white,
                                        elevation: 8,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Text('出社')),
                                  ElevatedButton(
                                      onPressed: () {
                                        print(_time);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                        onPrimary: Colors.white,
                                        elevation: 8,
                                        shape: const StadiumBorder(),
                                      ),
                                      child: Text('退勤')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: // 影のついたカードUIが作れる
                      Card(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey, //色
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(1, 1),
                          ),
                        ],
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                                color: Colors.blue,
                                child: Row(
                                  children: [
                                    Text(
                                      '作業一覧',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.white),
                                    ),
                                  ],
                                )),
                          ),
                          Card(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey, //色
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(1, 1),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              height: 60,
                              child: Column(
                                children: [
                                  Center(
                                      child: Column(
                                    children: [
                                      Text('2022/09/12'),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('予約の確認をする'),
                                      )
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey, //色
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(1, 1),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              height: 60,
                              width: double.infinity,
                              child: Text('Card'),
                            ),
                          ),
                          Card(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey, //色
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(1, 1),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              height: 60,
                              width: double.infinity,
                              child: Text('Card'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey, //色
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(1, 1),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.blue,
                          child: Row(
                            children: [
                              Text(
                                '今日の予定',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SfCalendar(
                          view: CalendarView.day,
                          monthViewSettings:
                              MonthViewSettings(showAgenda: true),
                          dataSource: getCalendarDataSource(),
                          onTap: calendarTapped,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void calendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment) {
      final Meeting appointmentDetails = details.appointments![0];
      _subjectText = appointmentDetails.eventName!;
      _dateText = DateFormat('MMMM dd, yyyy')
          .format(appointmentDetails.from!)
          .toString();
      _startTimeText =
          DateFormat('hh:mm a').format(appointmentDetails.from!).toString();
      _endTimeText =
          DateFormat('hh:mm a').format(appointmentDetails.to!).toString();
      if (appointmentDetails.isAllDay!) {
        _timeDetails = 'All day';
      } else {
        _timeDetails = '$_startTimeText - $_endTimeText';
      }
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Container(child: new Text('$_subjectText')),
              content: Container(
                height: 80,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '$_dateText',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(_timeDetails,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Id:" + appointmentDetails.id.toString())
                      ],
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                new ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text('close'))
              ],
            );
          });
    }
  }

  MeetingDataSource getCalendarDataSource() {
    List<Meeting> appointments = <Meeting>[];
    appointments.add(Meeting(
        from: DateTime.now().add(const Duration(hours: 2)),
        to: DateTime.now().add(const Duration(hours: 5)),
        eventName: 'Meeting',
        background: Colors.pink,
        id: 1));
    appointments.add(Meeting(
        from: DateTime.now().add(const Duration(hours: 4, days: -1)),
        to: DateTime.now().add(const Duration(hours: 5, days: 5)),
        eventName: 'Release Meeting',
        background: Colors.lightBlueAccent,
        id: 2));
    appointments.add(Meeting(
        from: DateTime.now().add(const Duration(hours: 2)),
        to: DateTime.now().add(const Duration(hours: 4)),
        eventName: 'Performance check',
        background: Colors.amber,
        id: 5));
    appointments.add(Meeting(
        from: DateTime.now().add(const Duration(hours: 6, days: -3)),
        to: DateTime.now().add(const Duration(hours: 7, days: -3)),
        eventName: 'Support',
        background: Colors.green,
        id: 3));
    appointments.add(Meeting(
        from: DateTime.now().add(const Duration(hours: 6, days: 2)),
        to: DateTime.now().add(const Duration(hours: 7, days: 2)),
        eventName: 'Retrospective',
        background: Colors.purple,
        id: 4));

    return MeetingDataSource(appointments);
  }
}

class Meeting {
  Meeting(
      {this.eventName,
      this.from,
      this.to,
      this.background,
      this.isAllDay = false,
      this.id});

  String? eventName;
  DateTime? from;
  DateTime? to;
  Color? background;
  bool? isAllDay;
  int? id;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }
}
