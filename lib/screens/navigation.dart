import 'dart:convert';

import 'package:broui/screens/introduction/Splash.dart';
import 'package:broui/styles/style.dart';
import 'package:broui/tabs/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../color/themecolor.dart';
import '../tabs/home.dart';

class Navigation extends StatefulWidget {
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  var y = 0;
  var scrn = [
    Center(
      child: Home(),
    ),
    Center(
      child: Profile(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: backcolor,
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Splash(),
              ),
            );
          },
          child: Text(
            "BRO",
            style: styl_white_20,
          ),
        ),
        actions: [Center()],
      ),
      body: scrn[y],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        color: backcolor,
        backgroundColor: somecolor,
        items: [
          Icon(Icons.home, color: iconcolor, size: 30),
          Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 30,
          ),
        ],
        onTap: (x) {
          setState(() {
            y = x;
          });
        },
      ),
    );
  }
}
