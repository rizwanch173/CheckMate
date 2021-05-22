import 'dart:convert';

import 'package:checkmate/API/Api_Controller.dart';
import 'package:checkmate/Tabs.dart';
import 'package:checkmate/pages/Singup.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../helper/app_config.dart' as config;
import '../elements/BlockButtonWidget.dart';
import 'forget_password.dart';
import '../main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _formkey = GlobalKey<FormState>();
  bool _isHidden = true;
  bool islogined = false;
  FocusNode myFocusNode;
  bool _isfalseabsorbing = false;
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: AbsorbPointer(
        absorbing: _isfalseabsorbing,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                width: config.App(context).appWidth(100),
                height: config.App(context).appHeight(37),
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
              ),
            ),
            Positioned(
              top: config.App(context).appHeight(37) - 120,
              child: Container(
                width: config.App(context).appWidth(84),
                height: config.App(context).appHeight(37),
                child: Text(
                  "Let's Start with Login!",
                  style: Theme.of(context).textTheme.display3.merge(TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
            Positioned(
              top: config.App(context).appHeight(37) - 50,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 50,
                        color: Theme.of(context).hintColor.withOpacity(0.2),
                      )
                    ]),
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                padding:
                    EdgeInsets.only(top: 50, right: 27, left: 27, bottom: 20),
                width: config.App(context).appWidth(88),
//              height: config.App(context).appHeight(55),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        focusNode: myFocusNode,
                        controller: username,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle:
                              TextStyle(color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: 'abdelmoslih',
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.2)),
                          prefixIcon: Icon(Icons.person,
                              color: Theme.of(context).accentColor),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Filed Requied';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: password,
                        keyboardType: TextInputType.text,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle:
                              TextStyle(color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: '••••••••••••',
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.7)),
                          prefixIcon: Icon(Icons.lock,
                              color: Theme.of(context).accentColor),
                          suffixIcon: IconButton(
                            color: Theme.of(context).accentColor,
                            onPressed: _toggleVisibility,
                            icon: _isHidden
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Filed Requied';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      BlockButtonWidget(
                        text: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            // ignore: unrelated_type_equality_checks
                            Login(username.text, password.text);
                          }
                        },
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ForgetPasswordWidget();
                      }));
                    },
                    textColor: Theme.of(context).hintColor,
                    child: Text("I forgot password ?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Singup();
                      }));
                    },
                    textColor: Theme.of(context).hintColor,
                    child: Text(
                      "I don't have an account?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future Login(String username, String password) async {
    setState(() {
      _isfalseabsorbing = true;
    });
    var json = jsonEncode({"username": username, "password": password});
    Response response = await post(MyApp.Base_url + "userlogin",
        headers: {"Content-Type": "application/json"}, body: json);
    Map<String, dynamic> user = jsonDecode(response.body);

    if (user['error']) {
      _showflashbar("Wrong Username or Password");
      setState(() {
        _isfalseabsorbing = false;
      });
    } else {
      APi().createState().addIntToSF(
          user["user"][0]["user_id"],
          user["user"][0]["username"],
          user["user"][0]["email"],
          user["user"][0]["location"],
          user["user"][0]["sex"],
          user["user"][0]["profile_image"]);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return Tabs();
      }));
    }
  }

  void _showflashbar(String message) {
    Flushbar(
        backgroundColor: Theme.of(context).accentColor,
        title: "Hey there",
        message: message,
        duration: Duration(seconds: 5),
        //margin: EdgeInsets.all(8),
        icon: Icon(
          Icons.info_outline,
          size: 40.0,
          color: Colors.red,
        ),
//        backgroundGradient: LinearGradient(
//          colors: [Color(0xFFFB415B), Color(0xFFEE5623)],
//        ),
        boxShadows: [
          BoxShadow(
            color: Colors.blue,
            offset: Offset(0.0, 2.0),
            blurRadius: 3.0,
          )
        ],
        leftBarIndicatorColor: Colors.red,
        borderRadius: 5)
      ..show(context);
    Future.delayed(const Duration(milliseconds: 5000), () {
      setState(() {
        myFocusNode.requestFocus();
      });
    });
  }
}
