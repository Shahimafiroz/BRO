import 'package:broui/authentication/login.dart';
import 'package:broui/color/themecolor.dart';
import 'package:broui/authentication/splash.dart';
import 'package:broui/screens/navigation.dart';
import 'package:broui/screens/planner/planner.dart';
import 'package:broui/tabs/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    print("firebase inilialized dum dum");
  });

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Planner(),
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData.dark(),
    theme: ThemeData(
      primaryColor: Color.fromARGB(255, 219, 206, 167),
    ),
  ));
}

//  Navigator.of(context).pop();
//  Navigator.push(context,MaterialPageRoute(builder: (context) => WidgetName()));

// class FirebaseTestCrud extends StatefulWidget {
//   @override
//   State<FirebaseTestCrud> createState() => _FirebaseTestCrudState();
// }

// class _FirebaseTestCrudState extends State<FirebaseTestCrud> {
//   TextEditingController _name = TextEditingController();
//   TextEditingController _age = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ListView(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: TextFormField(
//             controller: _name,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: TextFormField(
//             controller: _age,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: RaisedButton(
//               onPressed: () {
//                 FirebaseFirestore.instance
//                     .collection("UsersData")
//                     .doc(_name.text)
//                     .set({
//                   "name": _name.text,
//                   "age": _age.text,
//                 }).then((value) {
//                   Get.snackbar(
//                     "Data Send",
//                     "cSuccessfully stored data to database",
//                   );
//                   _name.text = "";
//                   _age.text = "";
//                 }).catchError((e) {
//                   Get.snackbar(
//                     "Data Send nahi hua bhai",
//                     "Error agay kya kare",
//                   );
//                   _name.text = "";
//                   _age.text = "";
//                 });
//               },
//               child: Text("Send Data", style: TextStyle(color: Colors.white)),
//               color: Colors.black),
//         ),
//         StreamBuilder(
//           stream:
//               FirebaseFirestore.instance.collection('UsersData').snapshots(),
//           builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//             if (!snapshot.hasData) {
//               return Center(
//                   child: Icon(
//                 Icons.sentiment_very_dissatisfied_outlined,
//                 size: 40,
//               ));
//             }
//             return ListView(
//               reverse: true,
//               shrinkWrap: true,
//               children: snapshot.data.docs.map<Widget>((document) {
//                 // return Text(document['UserName']);
//                 return GestureDetector(
//                   onDoubleTap: () {
//                     FirebaseFirestore.instance
//                         .collection('UsersData')
//                         .doc(document.id)
//                         .delete()
//                         .then((value) {
//                       Get.snackbar(
//                         "Deleted",
//                         "User details deleted",
//                       );
//                     });
//                   },
//                   child: Container(
//                       height: 70,
//                       margin: EdgeInsets.all(10),
//                       child: Column(
//                         children: [
//                           Text(
//                             document["name"],
//                             style: TextStyle(color: Colors.amber),
//                           ),
//                           Text(document["age"],
//                               style: TextStyle(color: Colors.amber))
//                         ],
//                       )),
//                 );
//               }).toList(),
//             );
//           },
//         )
//       ],
//     ));
//   }
// }
