import 'dart:html';

import 'package:broui/color/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class Team extends StatefulWidget {
  final Client client;
  final Channel channel;

  Team(this.client, this.channel);

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
