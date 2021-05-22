import 'dart:convert';

import 'package:checkmate/main.dart';
import 'package:checkmate/pages/Login.dart';
import 'package:checkmate/pages/Test.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:gender_selection/gender_selection.dart';
import 'package:http/http.dart';
import '../helper/app_config.dart' as config;
import '../elements/BlockButtonWidget.dart';
import 'package:email_validator/email_validator.dart';
import 'forget_password.dart';

class Singup extends StatefulWidget {
  @override
  _SingupState createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  var _formkey = GlobalKey<FormState>();
  bool _isHidden = true;
  bool islogined = false;
  FocusNode myFocusNode;
  bool _isfalseabsorbing = false;
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController sex = new TextEditingController();
  TextEditingController location = new TextEditingController();
  String userSex = "";

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
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
                height: config.App(context).appHeight(25),
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
              ),
            ),
            Positioned(
              top: config.App(context).appHeight(37) - 200,
              child: Container(
                width: config.App(context).appWidth(84),
                height: config.App(context).appHeight(37),
                child: Text(
                  "Let's Start with register!",
                  style: Theme.of(context).textTheme.display3.merge(TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
            Positioned(
              top: config.App(context).appHeight(37) - 140,
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
                    EdgeInsets.only(top: 40, right: 27, left: 27, bottom: 20),
                width: config.App(context).appWidth(88),
//              height: config.App(context).appHeight(55),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
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
                      SizedBox(height: 20),
                      //////////////         //////////////////////////             //////////////////////
                      TextFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle:
                              TextStyle(color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: 'abdelmoslih@gmail.com',
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.2)),
                          prefixIcon: Icon(Icons.alternate_email,
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
                          final bool isValid =
                              EmailValidator.validate(value.toString());
                          if (value.isEmpty) {
                            return 'Filed Requied';
                          }
                          if (!isValid) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                        controller: location,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Location",
                          labelStyle:
                              TextStyle(color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: '',
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.2)),
                          prefixIcon: Icon(Icons.my_location,
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

                      SizedBox(height: 20),

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
                          if (value.length <= 6) {
                            return 'Password is too Short';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                        child: GenderSelection(
                          maleImage: AssetImage("assets/male.png"),
                          femaleImage: AssetImage("assets/female.jpg"),
                          selectedGenderIconBackgroundColor: Colors.amber,
                          selectedGenderTextStyle: TextStyle(
                              color: Colors.amber,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          padding: const EdgeInsets.all(5),
                          onChanged: (Gender gender) {
                            if (gender.toString() == "Gender.Male")
                              userSex = "Male";
                            else
                              userSex = "Female";
                            print(userSex);
                          },
                          size: 160,
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      BlockButtonWidget(
                        text: Text(
                          "Singup",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          Singup();
                        },
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              child: Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Login();
                      }));
                    },
                    textColor: Theme.of(context).hintColor,
                    child: Text("I have account? Back to login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future Singup() async {
    if (_formkey.currentState.validate()) {
      setState(() {
        _isfalseabsorbing = true;
      });

      var json = jsonEncode({
        "username": username.text.toString(),
        "email": email.text.toString(),
        "location": location.text.toString(),
        "password": password.text.toString(),
        "sex": userSex
      });
      Response response = await post(MyApp.Base_url + "usersingup",
          headers: {"Content-Type": "application/json"}, body: json);
      Map<String, dynamic> user = jsonDecode(response.body);

      print(user);
      if (user['error']) {
        _showflashbar(user['message']);
        setState(() {
          _isfalseabsorbing = false;
        });
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return Login();
        }));
      }
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
