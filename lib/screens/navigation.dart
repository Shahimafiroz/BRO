import 'dart:convert';

import 'package:broui/authentication/splash.dart';
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
        backgroundColor: somecolor,
        actions: [
          Center(
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Splash()));
                },
                child: Text(
                  "BRO",
                  style: styl_black_30,
                )),
          )
        ],
      ),
      body: scrn[y],
      bottomNavigationBar: CurvedNavigationBar(
        color: backcolor,
        backgroundColor: somecolor,
        items: [
          Icon(
            Icons.home,
            color: iconcolor,
          ),
          Icon(
            Icons.account_circle,
            color: iconcolor,
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
