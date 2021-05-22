import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hashtagable/hashtagable.dart';
import '../helper/app_config.dart' as config;

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  TextEditingController description = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Create Post"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: new Icon(FontAwesomeIcons.paperPlane),
            onPressed: () {},
          ),
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        child: Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  TextFormField(
                    controller: description,
                    textAlign: TextAlign.start,
                    maxLines: 6,
                    maxLength: 160,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                    ),
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      //contentPadding: new EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 15.0,
                      ),
                      hintText: "Write Something",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
//      validator: (value) {
//        if (value.isEmpty) {
//          return 'Filed Requied';
//        }
//        return null;
//      },
                  ),
//                  Positioned(
//                    child: Padding(
//                      padding: const EdgeInsets.fromLTRB(10, 17, 0, 30),
//                      child: HashTagEditableText(
//
//                        maxLines: 6,
//                        controller: description,
//                        focusNode: FocusNode(),
//                        cursorColor: Theme.of(context).cursorColor,
//                        basicStyle: (Theme.of(context).textTheme.headline6),
//                        decoratedStyle: Theme.of(context)
//                            .textTheme
//                            .headline6
//                            .copyWith(color: Theme.of(context).accentColor),
//                      ),
//                    ),
//                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//              decoration: mybox(),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        decoration: mybox(),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              onPressed: () {},
                              iconSize: 34,
                              color: Colors.deepPurple,
                              icon: Icon(Icons.camera_alt),
                            ),
                            IconButton(
                              onPressed: () {},
                              iconSize: 34,
                              color: Colors.deepPurple,
                              icon: Icon(Icons.add_to_photos),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        decoration: mybox(),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              onPressed: () {},
                              iconSize: 34,
                              color: Colors.deepPurple,
                              icon: Icon(Icons.videocam),
                            ),
                            IconButton(
                              onPressed: () {},
                              iconSize: 34,
                              color: Color(0xFFFB415B),
                              icon: Icon(Icons.video_library),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: mybox(),
              child: Text("data"),
            )
          ],
        ),
      ),
    );
  }

  void check() {
    print("vaulu");
  }

  BoxDecoration mybox() {
    return BoxDecoration(
      border: Border.all(
        width: 1.0,
        color: Color(0xFFb0b0b0),
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(10.0) //         <--- border radius here
          ),
    );
  }
}
