//import 'package:checkmate/pages/Swip.dart';
//import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:smart_text_view/smart_text_view.dart';
//
//class PostItem extends StatefulWidget {
//  final String post_id;
//  final String user_id;
//  final String description;
//  final String visibility_score;
//  final String post_image;
//
//  PostItem(
//      {Key key,
//      @required this.post_id,
//      @required this.user_id,
//      @required this.description,
//      @required this.visibility_score,
//      @required this.post_image})
//      : super(key: key);
//  @override
//  _PostItemState createState() => _PostItemState();
//}
//
//class _PostItemState extends State<PostItem> {
//  @override
//  @override
//  Widget build(BuildContext context) {
//    return Stack(
//      children: <Widget>[
//        Container(
//          child: Column(
//            children: <Widget>[
//              Container(
//                  decoration: BoxDecoration(
//                    border: Border.all(color: Colors.black, width: 3),
//                  ),
//                  child: FadeInImage.assetNetwork(
//                      height: MediaQuery.of(context).size.height - 270,
//                      width: MediaQuery.of(context).size.width,
//                      fit: BoxFit.cover,
//                      placeholder: "assets/loading.gif",
//                      image: "${widget.post_image}")),
//              SizedBox(
//                height: 10,
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Expanded(
//                    child: SmartText(
//                      style: TextStyle(
//                        fontSize: 18,
//                      ),
//                      text: "${widget.description}",
//                      onTagClick: (tag) {
//                        print(tag);
//                      },
//                      linkStyle: TextStyle(
//                        color: Colors.black,
//                        fontWeight: FontWeight.bold,
//                      ),
//                    ),
//                  ),
//                  IconButton(
//                    icon: Icon(
//                      FontAwesomeIcons.solidFlag,
//                      size: 30,
//                    ),
//                    onPressed: () {
//                      Swip().moveWithView();
//                    },
//                  ),
//                ],
//              ),
//            ],
//          ),
//        ),
//        Visibility(
//          visible: Swip.Visible_left,
//          child: Positioned(
//            top: MediaQuery.of(context).size.height / 5,
//            left: 2,
//            child: Container(
//                height: MediaQuery.of(context).size.height - 500,
//                decoration: BoxDecoration(
//                    color: Colors.white.withOpacity(0.1),
//                    borderRadius: BorderRadius.all(Radius.circular(10)),
//                    boxShadow: [
//                      BoxShadow(
//                        blurRadius: 50,
//                        color: Theme.of(context).hintColor.withOpacity(0.5),
//                      )
//                    ]),
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Material(
//                        elevation: 7.0,
//                        shape: CircleBorder(),
//                        clipBehavior: Clip.hardEdge,
//                        color: Colors.transparent,
//                        child: Ink.image(
//                          image: AssetImage('assets/four.png'),
//                          fit: BoxFit.cover,
//                          width: 55,
//                          height: 55,
//                          child: InkWell(
//                            onTap: () {
//                              Swip().moveWithView();
//                              Swip.Visible_right = false;
//                              Swip.Visible_left = false;
//                            },
//                          ),
//                        ),
//                      ),
//                      Material(
//                        elevation: 7.0,
//                        shape: CircleBorder(),
//                        clipBehavior: Clip.hardEdge,
//                        color: Colors.transparent,
//                        child: Ink.image(
//                          image: AssetImage('assets/two.png'),
//                          fit: BoxFit.cover,
//                          width: 55,
//                          height: 55,
//                          child: InkWell(
//                            onTap: () {
//                              Swip().moveWithView();
//                              Swip.Visible_right = false;
//                              Swip.Visible_left = false;
//                            },
//                          ),
//                        ),
//                      ),
//                      Material(
//                        elevation: 7.0,
//                        shape: CircleBorder(),
//                        clipBehavior: Clip.hardEdge,
//                        color: Colors.transparent,
//                        child: Ink.image(
//                          image: AssetImage('assets/zero.png'),
//                          fit: BoxFit.cover,
//                          width: 55,
//                          height: 55,
//                          child: InkWell(
//                            onTap: () {
//                              Swip().moveWithView();
//                              Swip.Visible_right = false;
//                              Swip.Visible_left = false;
//                            },
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                )),
//          ),
//        ),
//        Visibility(
//          visible: Swip.Visible_right,
//          child: Positioned(
//            top: MediaQuery.of(context).size.height / 5,
//            left: MediaQuery.of(context).size.width - 73,
//            //left: MediaQuery.of(context).size.height - 550,
//            child: Container(
//                height: MediaQuery.of(context).size.height - 500,
//                decoration: BoxDecoration(
//                    color: Colors.white.withOpacity(0.1),
//                    borderRadius: BorderRadius.all(Radius.circular(10)),
//                    boxShadow: [
//                      BoxShadow(
//                        blurRadius: 50,
//                        color: Theme.of(context).hintColor.withOpacity(0.5),
//                      )
//                    ]),
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Material(
//                        elevation: 7.0,
//                        shape: CircleBorder(),
//                        clipBehavior: Clip.hardEdge,
//                        color: Colors.transparent,
//                        child: Ink.image(
//                          image: AssetImage('assets/ten.png'),
//                          fit: BoxFit.cover,
//                          width: 55,
//                          height: 55,
//                          child: InkWell(
//                            onTap: () {
//                              Swip().moveWithView();
//                              Swip.Visible_right = false;
//                              Swip.Visible_left = false;
//                            },
//                          ),
//                        ),
//                      ),
//                      Material(
//                        elevation: 7.0,
//                        shape: CircleBorder(),
//                        clipBehavior: Clip.hardEdge,
//                        color: Colors.transparent,
//                        child: Ink.image(
//                          image: AssetImage('assets/eight.png'),
//                          fit: BoxFit.cover,
//                          width: 55,
//                          height: 55,
//                          child: InkWell(
//                            onTap: () {
//                              Swip().moveWithView();
//                              Swip.Visible_right = false;
//                              Swip.Visible_left = false;
//                            },
//                          ),
//                        ),
//                      ),
//                      Material(
//                        elevation: 7.0,
//                        shape: CircleBorder(),
//                        clipBehavior: Clip.hardEdge,
//                        color: Colors.transparent,
//                        child: Ink.image(
//                          image: AssetImage('assets/six.png'),
//                          fit: BoxFit.cover,
//                          width: 55,
//                          height: 55,
//                          child: InkWell(
//                            onTap: () {
//                              Swip().moveWithView();
//                              Swip.Visible_right = false;
//                              Swip.Visible_left = false;
//                            },
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                )),
//          ),
//        ),
//      ],
//    );
//  }
//}
