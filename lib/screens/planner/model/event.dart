import 'package:flutter/material.dart';

class Eventdata {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;
  final bool isAllDay;

  Eventdata(
      {this.title,
      this.description,
      this.from,
      this.to,
      this.backgroundColor,
      this.isAllDay}) {}
}
