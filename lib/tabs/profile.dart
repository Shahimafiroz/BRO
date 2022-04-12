import 'dart:ui';

import 'package:broui/color/themecolor.dart';
import 'package:broui/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController Businessname = TextEditingController();
  TextEditingController Website = TextEditingController();
  TextEditingController Contact = TextEditingController();
  TextEditingController Email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff121113),
      // ),
      backgroundColor: Color.fromARGB(255, 22, 21, 21),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              "Home",
              style: styl_white_30,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvtar(
                      "https://cdn.pixabay.com/photo/2016/11/22/06/05/girl-1848454__340.jpghttps://cdn.pixabay.com/photo/2016/11/22/06/05/girl-1848454__340.jpg"),
                ),
                Container(
                  // color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text_field("Shahima Firoz Khan"),
                      // space(4.0),
                      text_field("21 Years"),
                      // space(4.0),
                      text_field(
                          "Employee at Google for 10 years | Ex - Microsoft"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          space(20.00),
          // white_div(),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  box("Accounts", Icons.account_circle),
                  box("Planner", Icons.calendar_month),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  box("Sales", Icons.swap_vert_circle_sharp),
                  box("Team", Icons.theater_comedy_sharp),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //box("Sales Analysis"),
                  box("Explore page", Icons.explore),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget box(txt, icn) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      width: MediaQuery.of(context).size.width / 2.3,
      decoration: BoxDecoration(
          color: Color(0xff899878),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Center(
            child: Text(
              txt,
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 8, 0, 0),
              ),
            ),
          ),
          Center(
            child: Icon(
              icn,
              color: Color.fromARGB(255, 8, 0, 0),
              size: 60,
            ),
          ),
        ],
      ),
    );
  }

  Widget space(len) {
    return SizedBox(
      height: len,
    );
  }

  Widget white_div() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Divider(
        color: Colors.white,
        height: 10,
        thickness: 3,
      ),
    );
  }

  Widget CircleAvtar(img) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 47, 48, 50),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(img),
        ),
      ),
    );
  }

  Widget text_field(txt) {
    return Container(
        width: 200,
        padding: EdgeInsets.all(10),
        child: Text(
          txt,
          overflow: TextOverflow.ellipsis,
          maxLines: 10,
          // style: styl_white_20,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }

  Widget text_field2(val, txt) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(val, style: styl_white_20),
                Text(txt, style: styl_white_20),
              ],
            ),
            Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Divider(color: Colors.white, height: 10)),
          ],
        ));
  }

  Widget text_form_field(var contrl, var hint, var icn) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: TextFormField(
        controller: contrl,
        style: styl_white_20,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: styl_white13,
        ),
      ),
    );
  }
}
