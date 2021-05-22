import 'dart:convert';
import 'package:checkmate/main.dart';
import 'package:http/http.dart' as http;
import 'package:checkmate/Model/Post.dart';
import 'package:checkmate/Model/PostItem.dart';
import 'package:checkmate/pages/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:indexed_list_view/indexed_list_view.dart';
import 'package:smart_text_view/smart_text_view.dart';
import 'package:swipedetector/swipedetector.dart';

class Swip extends StatefulWidget {
  @override
  _SwipState createState() => _SwipState();
}

class _SwipState extends State<Swip> {
  int count = 0;
  bool Visible_left = false;
  bool Visible_right = false;
  ScrollController controller;
  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  moveDown() {
    //_controller.jumpTo(_controller.offset + itemSize);
    controller.animateTo(
        controller.offset + MediaQuery.of(context).size.height - 100,
        curve: Curves.easeInOutExpo,
        duration: Duration(milliseconds: 600));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Lets Play",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        toolbarOpacity: 0.2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10.0),
                ),
              ),
              height: MediaQuery.of(context).size.height - 150,
              padding: EdgeInsets.all(2),
              child: FutureBuilder<List<Post>>(
                future: _fetchAllPost(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Post> data = snapshot.data;
                    return _get_swipe_post(data);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _get_swipe_post(data) {
    return ListView.builder(
        //scrollDirection: Axis.vertical,
        //shrinkWrap: true,
        itemCount: data.length,
        physics: new NeverScrollableScrollPhysics(),
        controller: controller,
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height - 100,
            child: SwipeDetector(
              swipeConfiguration:
                  SwipeConfiguration(horizontalSwipeMinDisplacement: 0),
              onSwipeLeft: () {
                setState(() {
                  Visible_right = true;
                  print("swipe left");
                });
              },
              onSwipeRight: () {
                setState(() {
                  Visible_left = true;
                  print("swipe right");
                });
              },
              child: viewSwipe(data[index].description, data[index].post_image),

//              PostItem(
//              post_id: data[index].post_id,
//              user_id: data[index].user_id,
//              description: data[index].description,
//              visibility_score: data[index].visibility_score,
//              post_image: data[index].post_image,
//            ),
//            onTap: () {
////              post_id = (data[index].postid);
////              print(post_id);
//            },
            ),
          );
        });
  }

  Widget viewSwipe(description, post_image) {
    //print(MediaQuery.of(context).size.height - 270);
    return Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                  child: FadeInImage.assetNetwork(
                      height: MediaQuery.of(context).size.height - 270,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      placeholder: "assets/loading.gif",
                      image: post_image)),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: SmartText(
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      text: description,
                      onTagClick: (tag) {
                        print(tag);
                      },
                      linkStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.solidFlag,
                      size: 30,
                    ),
                    onPressed: () {
                      moveDown();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Visibility(
          visible: Visible_left,
          child: Positioned(
            top: MediaQuery.of(context).size.height / 50,
            left: 2,
            child: Container(
                height: MediaQuery.of(context).size.height - 350,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 50,
                        color: Theme.of(context).hintColor.withOpacity(0.5),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Material(
                        elevation: 7.0,
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: Ink.image(
                          image: AssetImage('assets/four.png'),
                          fit: BoxFit.cover,
                          width: 55,
                          height: 55,
                          child: InkWell(
                            onTap: () {
                              moveDown();
                              Visible_right = false;
                              Visible_left = false;
                            },
                          ),
                        ),
                      ),
                      Material(
                        elevation: 7.0,
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: Ink.image(
                          image: AssetImage('assets/two.png'),
                          fit: BoxFit.cover,
                          width: 55,
                          height: 55,
                          child: InkWell(
                            onTap: () {
                              moveDown();
                              Visible_right = false;
                              Visible_left = false;
                            },
                          ),
                        ),
                      ),
                      Material(
                        elevation: 7.0,
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: Ink.image(
                          image: AssetImage('assets/zero.png'),
                          fit: BoxFit.cover,
                          width: 55,
                          height: 55,
                          child: InkWell(
                            onTap: () {
                              moveDown();
                              Visible_right = false;
                              Visible_left = false;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Visibility(
          visible: Visible_right,
          child: Positioned(
            top: MediaQuery.of(context).size.height / 50,
            left: MediaQuery.of(context).size.width - 73,
            //left: MediaQuery.of(context).size.height - 550,
            child: Container(
                height: MediaQuery.of(context).size.height - 350,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 50,
                        color: Theme.of(context).hintColor.withOpacity(0.5),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Material(
                        elevation: 7.0,
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: Ink.image(
                          image: AssetImage('assets/ten.png'),
                          fit: BoxFit.cover,
                          width: 55,
                          height: 55,
                          child: InkWell(
                            onTap: () {
                              moveDown();
                              Visible_right = false;
                              Visible_left = false;
                            },
                          ),
                        ),
                      ),
                      Material(
                        elevation: 7.0,
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: Ink.image(
                          image: AssetImage('assets/eight.png'),
                          fit: BoxFit.cover,
                          width: 55,
                          height: 55,
                          child: InkWell(
                            onTap: () {
                              moveDown();
                              Visible_right = false;
                              Visible_left = false;
                            },
                          ),
                        ),
                      ),
                      Material(
                        elevation: 7.0,
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: Ink.image(
                          image: AssetImage('assets/six.png'),
                          fit: BoxFit.cover,
                          width: 55,
                          height: 55,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                Visible_right = false;
                                Visible_left = false;
                                moveDown();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }

  Future<List<Post>> _fetchAllPost() async {
    final response = await http.get(MyApp.Base_url + "getswippost/6");

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      List jsonResponse = json.decode(response.body);
      //  print(jsonResponse);
      return jsonResponse.map((job) => new Post.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
}
