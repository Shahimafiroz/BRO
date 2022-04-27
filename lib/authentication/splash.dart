import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:broui/Authentication/login.dart';

import '../screens/navigation.dart';

//import 'package:watch_out/Navigation/navigation.dart';
//Live server check
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var colr;
  bool usercheck = false;
  @override
  void initState() {
    // usercheck = getData();
    Timer(Duration(seconds: 2), () {
      // usercheck = getData();
      directLogin();
    });
  }

  directLogin() async {
    print("Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    // getData();
    var collectionRef = FirebaseFirestore.instance.collection('users');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('email');
    prefs.getString('pass');
    var doc = await collectionRef.doc(id).get();
    setState(() {
      usercheck = doc.exists;
    });

    if (usercheck) {
      if (usercheck) {
        print('fuid');
        Navigator.of(context).pop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Navigation()));
      } else {
        Navigator.of(context).pop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => login()));
      }
    } else {
      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 254, 254, 254),
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
              image: AssetImage('assets/icons/appicon.jpg'),
            ),
          ), // child: Text(provider.uid),
        ),
      ),
    );
  }

  // getData() async {
  //   var collectionRef = FirebaseFirestore.instance.collection('users');
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.getString('email');
  //   prefs.getString('pass');
  //   var doc = await collectionRef.doc().get();
  //   setState(() {
  //     usercheck = doc.exists;
  //   });
  // }
}
