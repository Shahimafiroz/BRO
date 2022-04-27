//import 'dart:html';

import 'package:broui/Authentication/splash.dart';
import 'package:broui/Services/displaydata.dart';
import 'package:broui/authentication/login.dart';
import 'package:broui/color/themecolor.dart';
import 'package:broui/screens/introduction/Splash.dart';
import 'package:broui/screens/navigation.dart';
import 'package:broui/screens/planner/page/planner.dart';
import 'package:broui/tabs/profile.dart';
import 'package:broui/team/team.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() async {
//   final client = StreamChatClient('m2pbgb9hz7dq', logLevel: Level.INFO);
//   await client.connectUser(
//     User(id: 'tutorial-flutter'),
//     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZmx1dHRlciJ9.S-MJpoSwDiqyXpUURgO5wVqJ4vKlIVFLSEyrFYCOE1c',
//   );
// //streamchatclient
//   final channel = client.channel('messaging', id: 'flutterdevs');
// //current user
//   await channel.watch();
// //Get channnel
//   channel.watch();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    print("firebase inilialized dum dum");
  });

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData.dark(),
    theme: ThemeData(
      primaryColor: Color.fromARGB(255, 219, 206, 167),
    ),
  ));
}
