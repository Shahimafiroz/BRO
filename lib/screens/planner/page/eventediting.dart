import 'dart:html';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Eventediting extends StatefulWidget {
  final Events event;

  const Eventediting({key, this.event}) : super(key: key);

  @override
  State<Eventediting> createState() => _EventeditingState();
}

class _EventeditingState extends State<Eventediting> {
  DateTime fromDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
