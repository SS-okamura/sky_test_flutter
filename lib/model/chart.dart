import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chart {
  final String title;
  final String content;
  final DateTime date;
  final int authority_flg;

  Chart(
      {required this.title,
      required this.content,
      required this.date,
      required this.authority_flg});
}
