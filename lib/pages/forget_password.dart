import 'package:checkmate/pages/Login.dart';
import 'package:checkmate/pages/Singup.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../elements/BlockButtonWidget.dart';
import '../helper/app_config.dart' as config;

class ForgetPasswordWidget extends StatefulWidget {
  @override
  _ForgetPasswordWidgetState createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
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
                  "Email to reset password",
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
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 27),
                width: config.App(context).appWidth(88),
//              height: config.App(context).appHeight(55),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,

                        //validator: (input) => !input.contains('@') ? S.of(context).should_be_a_valid_email : null,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle:
                              TextStyle(color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: 'abdelmoslih@gmail.com',
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.7)),
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
                      ),
                      SizedBox(height: 30),
                      BlockButtonWidget(
                        text: Text(
                          "Send Password",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Theme.of(context).accentColor,
                        onPressed: () {
//                          _con.resetPassword();
                        },
                      ),
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
                        return Login();
                      }));
                    },
                    textColor: Theme.of(context).hintColor,
                    child: Text("i remember my password return to login",
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
                    child: Text("i don't have an account?",
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
}
