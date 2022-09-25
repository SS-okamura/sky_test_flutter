import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:web_vue/model/event_data_sourve.dart';
import 'package:web_vue/page/event_detail_page.dart';
import 'package:web_vue/provider/event_provider.dart';
import '../provider/event_provider.dart';

class TaskWidget extends StatefulWidget {
  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOfSelectedDate;
    if (selectedEvents.isEmpty) {
      return Center(
        child: Text('イベントがありません',
            style: TextStyle(color: Colors.black, fontSize: 24)),
      );
    }
    return SfCalendar(
      view: CalendarView.timelineDay,
      dataSource: EventDataSource(provider.events),
      initialDisplayDate: provider.selectedDate,
      selectionDecoration: BoxDecoration(color: Colors.red.withOpacity(0.3)),
      onTap: (details) {
        if (details.appointments == null) return;
        final event = details.appointments!.first;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDefalutPage(event: event),
          ),
        );
      },
    );
  }
}
