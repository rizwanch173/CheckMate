import 'package:checkmate/API/Api_Controller.dart';
import 'package:checkmate/pages/Login.dart';
import 'package:checkmate/pages/Singup.dart';
import 'package:checkmate/pages/Swip.dart';
import 'package:checkmate/pages/Test.dart';
import 'package:flutter/material.dart';
import 'Tabs.dart';
import 'package:checkmate/pages/Temp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static String Base_url = "http://192.168.8.102/checkmate/index.php/api/";
  static int login_id;
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    APi().createState().getIntValuesSF();

    if (login_id != null) {
      isLogin = true;
    }

    return MaterialApp(
      title: 'Check Mate',
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        accentColor: Color(0xFF0658FD),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: isLogin ? Tabs() : Login(),
//      home: Login(),
    );
  }
}
