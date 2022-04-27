import 'package:broui/color/themecolor.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Eventeditingpage extends StatefulWidget {
// const Eventeditingpage({

// var event,
//  Key key,
//  this.event,

// }) :super (key: key);

  @override
  State<Eventeditingpage> createState() => _EventeditingpageState();
}

class _EventeditingpageState extends State<Eventeditingpage> {
  final _formKey = GlobalKey<FormState>();
  DateTime fromdate;
  DateTime todate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fromdate = DateTime.now();
    todate = DateTime.now().add(Duration(hours: 2));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    List<Widget> buildEditingActions() => [
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              onPressed: () {},
              icon: Icon(Icons.done),
              label: Text('SAVE'))
        ];

    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        actions: buildEditingActions(),
        backgroundColor: buttoncolor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[],
            ),
          ),
        ),
      ),
    );

    // // ignore: dead_code
    // List<Widget> buildEditingActions() => [
    //       ElevatedButton.icon(
    //           onPressed: () {}, icon: Icon(Icons.done), label: Text('SAVE'))
    //     ];
  }
}
