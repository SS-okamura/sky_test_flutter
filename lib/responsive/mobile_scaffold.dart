import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:intl/intl.dart';
import 'package:matcher/matcher.dart';
import 'package:web_vue/constants.dart';
import 'package:web_vue/util/my_box.dart';
import 'package:web_vue/util/my_title.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:async';

class mobileScaffold extends StatefulWidget {
  const mobileScaffold({Key? key}) : super(key: key);

  @override
  State<mobileScaffold> createState() => _mobileScaffoldState();
}

class _mobileScaffoldState extends State<mobileScaffold> {
  @override
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
    var dateFormat = DateFormat('HH:mm:ss');

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

  Widget build(BuildContext context) {
    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List getEvent(DateTime day) {
      return _events[day] ?? [];
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text('S N A P S H O T'),
          actions: <Widget>[
            PopupMenuButton<String>(
              icon: Icon(Icons.account_circle),
              initialValue: _selectedValue,
              onSelected: (String s) {
                setState(() {
                  _selectedValue = s;
                });
              },
              itemBuilder: (BuildContext context) {
                return _usStates.map((String s) {
                  return PopupMenuItem(
                    child: Text(s),
                    value: s,
                  );
                }).toList();
              },
            )
          ],
        ),
        backgroundColor: myDefalutBackground,
        drawer: myDrawer,
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 3,
              child: SizedBox(
                width: double.infinity,
                child: GridView.builder(
                    itemCount: 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  _time,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 64),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          print(_time);
                                        },
                                        child: Text('出社')),
                                    ElevatedButton(
                                        onPressed: () {
                                          print(_time);
                                        },
                                        child: Text('退勤'))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(color: Colors.grey),
                children: <TableRow>[
                  TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      children: ['title1', 'title2']
                          .map((e) => Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(e)))
                          .toList()),
                  TableRow(
                    children: ['abc', '123']
                        .map((e) => Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(e)))
                        .toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                color: Colors.grey[200],
                child: Center(
                  child: Column(
                    children: [
                      Text('カレンダー'),
                      TableCalendar(
                        headerVisible: false,
                        eventLoader: getEvent,
                        firstDay: DateTime.utc(2022, 9, 1),
                        lastDay: DateTime.utc(2022, 9, 31),
                        selectedDayPredicate: (day) {
                          return isSameDay(_selected, day);
                        },
                        // --追記----------------------------------
                        onDaySelected: (selected, focused) {
                          if (!isSameDay(_selected, selected)) {
                            setState(() {
                              _selected = selected;
                              _focused = focused;
                            });
                          }
                        },
                        focusedDay: _focused,
                        // カスタマイズ用の関数を渡してやりましょう
                        calendarBuilders: CalendarBuilders(defaultBuilder:
                            (BuildContext context, DateTime day,
                                DateTime focusedDay) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.green[600]!,
                                width: 0.5,
                              ),
                            ),
                            alignment: Alignment.topCenter,
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(
                                color: _textColor(day),
                              ),
                            ),
                          );
                        }, markerBuilder: (BuildContext context, DateTime day,
                            List<dynamic> dailyScheduleList) {
                          print(dailyScheduleList);
                          _dailyCount(List<dynamic> dailyScheduleList) {}
                        }),

                        // --追記----------------------------------
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: getEvent(_selected!)
                            .map((event) => ListTile(
                                  title: Text(event.toString()),
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
