import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../constants.dart';
import '../model/event_data_sourve.dart';
import '../page/event_editing_page.dart';
import '../provider/event_provider.dart';
import '../widget/tasks_widget.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
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

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return MaterialApp(
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
          },
        ),
        body: SafeArea(
          child: SfCalendar(
            view: CalendarView.week,
            monthViewSettings: MonthViewSettings(showAgenda: true),
            //dataSource: getCalendarDataSource(),
            dataSource: EventDataSource(events),
            //onTap: calendarTapped,
            onLongPress: (details) {
              final provider =
                  Provider.of<EventProvider>(context, listen: false);
              provider.setDate(details.date!);
              showModalBottomSheet(
                  context: context, builder: (context) => TaskWidget());
            },
            allowedViews: [
              CalendarView.day,
              CalendarView.week,
              CalendarView.month,
            ],
          ),
        ),
      ),
    );
  }

  void calendarTapped(CalendarTapDetails details) {
    print(details);
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
