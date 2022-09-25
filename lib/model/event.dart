import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backgroundColer;
  final bool isAllDay;

  Event(
      {required this.title,
      required this.description,
      required this.from,
      required this.to,
      this.backgroundColer = Colors.lightGreen,
      this.isAllDay = false});
}
