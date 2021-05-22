import 'dart:convert';

import 'package:checkmate/helper/app_config.dart';
import 'package:checkmate/main.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APi extends StatefulWidget {
  @override
  _APiState createState() => _APiState();
}

class _APiState extends State<APi> {
  @override
  addIntToSF(
      String user_id, username, email, location, sex, profile_image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("" + user_id);
    prefs.setInt('user_id', int.parse(user_id));
    prefs.setString('username', username);
    prefs.setString('email', email);
    prefs.setString('location', location);
    prefs.setString('sex', sex);
    prefs.setString('profile_image', profile_image);
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int intValue = prefs.getInt('user_id');
    MyApp.login_id = intValue;
  }

  Widget build(BuildContext context) {
    return Container();
  }
}
