import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:web_vue/event_editing_page.dart';

import '../constants.dart';
import '../model/event_data_source.dart';
import '../provider/event_provider.dart';
import '../scheduleAdd.dart';

DateTime _inputDate = DateTime.now();
var _fromDatetime = DateTime.now();
DateTime _toDatetime = DateTime.now();

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  var _fromDatetime = DateTime.now();
  List<Meeting> appointments = <Meeting>[];
  String scheduleTitle = '';
  TextEditingController _textEditingController = TextEditingController();
  String _subjectText = '',
      _startTimeText = '',
      _endTimeText = '',
      _dateText = '',
      _timeDetails = '';

  var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm');

  Future _openStartTime(BuildContext context) async {
    // （3） ダイアログを表示する
    final DateTime? _date = await DatePicker.showDateTimePicker(context,
        showTitleActions: true, onConfirm: (date) {
      setState(() {
        _fromDatetime = date;
      });
    }, currentTime: DateTime.now(), locale: LocaleType.jp);
    // （6） 選択された場合に、値を設定する
    if (_date != null) {
      setState(() {
        _fromDatetime = _date;
      });
      print(_fromDatetime);
    }
  }

  Future _openEndTime(BuildContext context) async {
    // （3） ダイアログを表示する
    final DateTime? _date = await DatePicker.showDateTimePicker(context,
        showTitleActions: true, onConfirm: (date) {
      print(_toDatetime);
      _toDatetime = date;
      print(_toDatetime);
      setState(() {});
    }, currentTime: DateTime.now(), locale: LocaleType.jp);
    // （6） 選択された場合に、値を設定する
    print(_date);
    if (_date != null) {
      setState(() {
        _textEditingController.text = _date.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: MyAppBer(titleName: 'カレンダー'),
          drawer: MyDrawer(),
          floatingActionButton: FloatingActionButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventEditingPage(),
                  ),
                );
              }
              //   showModalBottomSheet(
              //       builder: (BuildContext context) {
              //         return StatefulBuilder(
              //             builder: (context, StateSetter setState) {
              //           return Container(
              //               height: 400,
              //               child: Center(
              //                 child: Column(
              //                   children: <Widget>[
              //                     Padding(
              //                       padding: const EdgeInsets.all(8.0),
              //                       child: TextField(
              //                         onChanged: (value) {
              //                           scheduleTitle = value;
              //                         },
              //                         decoration: InputDecoration(
              //                           hintText: 'タイトルを入力',
              //                         ),
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.all(8.0),
              //                       child: OutlinedButton(
              //                         onPressed: () async {
              //                           // （3） ダイアログを表示する
              //                           final DateTime? _date =
              //                               await DatePicker.showDateTimePicker(
              //                                   context,
              //                                   showTitleActions: true,
              //                                   onConfirm: (date) {
              //                             _fromDatetime = date;
              //                             setState(() {});
              //                           },
              //                                   currentTime: DateTime.now(),
              //                                   locale: LocaleType.jp);
              //                           // （6） 選択された場合に、値を設定する
              //                           print(_date);
              //                           if (_date != null) {
              //                             setState(() {
              //                               _textEditingController.text =
              //                                   _date.toString();
              //                             });
              //                           }
              //                         },
              //                         child: Row(
              //                           children: <Widget>[
              //                             Text(
              //                               '開始日時: ',
              //                               style: TextStyle(
              //                                 fontWeight: FontWeight.w400,
              //                               ),
              //                             ),
              //                             Text(
              //                               formatter.format(_fromDatetime),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.all(8.0),
              //                       child: Row(
              //                         children: <Widget>[
              //                           Text(
              //                             '終了日時: ',
              //                             style: TextStyle(
              //                               fontWeight: FontWeight.w400,
              //                             ),
              //                           ),
              //                           OutlinedButton(
              //                             onPressed: () async {
              //                               final DateTime? _date =
              //                                   await DatePicker.showDateTimePicker(
              //                                       context,
              //                                       showTitleActions: true,
              //                                       onConfirm: (date) {
              //                                 print(_toDatetime);
              //                                 _toDatetime = date;
              //                                 print(_toDatetime);
              //                                 setState(() {});
              //                               },
              //                                       currentTime: DateTime.now(),
              //                                       locale: LocaleType.jp);
              //                               // （6） 選択された場合に、値を設定する
              //                               print(_date);
              //                               if (_date != null) {
              //                                 setState(() {
              //                                   _textEditingController.text =
              //                                       _date.toString();
              //                                 });
              //                               }
              //                             },
              //                             child: Text(
              //                               // フォーマッターを使用して指定したフォーマットで日時を表示
              //                               // format()に渡すのはDate型の値で、String型で返される
              //                               formatter.format(_toDatetime),
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.all(8.0),
              //                       child: Center(
              //                         child: ElevatedButton(
              //                             onPressed: () {
              //                               print(scheduleTitle);
              //                               appointments.add(Meeting(
              //                                   from: _fromDatetime,
              //                                   to: _toDatetime,
              //                                   eventName: scheduleTitle,
              //                                   background: Colors.pink,
              //                                   isAllDay: true,
              //                                   id: 1));
              //                               setState() {}
              //                             },
              //                             child: new Text('追加')),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ));
              //         });
              //       },
              //       context: context);
              // },
              ),
          body: SafeArea(
            child: SfCalendar(
              view: CalendarView.week,
              monthViewSettings: MonthViewSettings(showAgenda: true),
              //dataSource: getCalendarDataSource(),
              dataSource: EventDataSource(events),
              onTap: calendarTapped,
              allowedViews: [
                CalendarView.day,
                CalendarView.week,
                CalendarView.month,
              ],
            ),
          ),
        ),
      ),
    );
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
    appointments.add(Meeting(
        from: DateTime.now(),
        to: DateTime.now().add(const Duration(hours: 1)),
        eventName: 'Meeting',
        background: Colors.pink,
        isAllDay: true,
        id: 1));
    appointments.add(Meeting(
        from: DateTime.now().add(const Duration(hours: 4, days: -1)),
        to: DateTime.now().add(const Duration(hours: 5, days: 5)),
        eventName: 'Release Meeting',
        background: Colors.lightBlueAccent,
        id: 2));
    appointments.add(Meeting(
        from: DateTime.now().add(const Duration(hours: 2, days: -2)),
        to: DateTime.now().add(const Duration(hours: 4, days: -2)),
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
