import 'dart:ui';

import 'package:broui/color/themecolor.dart';
import 'package:broui/screens/planner/page/eventediting.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Colors,
        Container,
        FloatingActionButton,
        Icons,
        MaterialPageRoute,
        Scaffold,
        State,
        StatefulWidget,
        Text,
        Widget;
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Planner extends StatefulWidget {
  @override
  State<Planner> createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SfCalendar(
          view: CalendarView.month,
          todayHighlightColor: const Color.fromARGB(255, 146, 113, 2),
        ),
      ),
      // ignore: prefer_const_constructors
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Color.fromARGB(255, 108, 81, 2),
          // Within the `FirstRoute` widget
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Eventeditingpage()),
            );
          }),
    );
  }
}
