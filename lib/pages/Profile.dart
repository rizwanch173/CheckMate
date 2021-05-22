import 'package:checkmate/pages/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Visibility",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              "20%",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0)),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 50,
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.2),
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Swap to increase Popularity",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SvgPicture.asset(
                              "assets/boost.svg",
                              fit: BoxFit.cover,
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.7,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25.0),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 50,
                    color: Theme.of(context).hintColor.withOpacity(0.2),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Ranking",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 8,
                              ),
                              child: Text(
                                "20%",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Best Ranking",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 8,
                              ),
                              child: Text(
                                "20%",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: CircularPercentIndicator(
                          radius: 100.0,
                          lineWidth: 10.0,
                          animation: true,
                          animationDuration: 1000,
                          percent: 0.80,
                          center: new CircleAvatar(
                            radius: 37,
                            backgroundImage: AssetImage("assets/male.png"),
                          ),
                          footer: new Text(
                            "@Username",
                            style: new TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.green,
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              child: Icon(
                                Icons.location_on,
                                color: Color(0xFF000000).withOpacity(0.5),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 5,
                              ),
                              child: Text(
                                "Eroup Sindney",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton(
                              color: Theme.of(context).accentColor,
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            RaisedButton(
                              color: Theme.of(context).accentColor,
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Inbox',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.message,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Flexible(
            child: AnimatedList(
              shrinkWrap: true,
              // key: _listKey,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                //  Map post = posts[index];

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green[400],
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0)),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 50,
                                  color: Theme.of(context)
                                      .hintColor
                                      .withOpacity(0.2),
                                )
                              ]),
                          height: 100,
                          width: 300,
                          child: Center(child: Text("data")),
                        ),
                      ],
                    ),
                  ),
                );
              },
              initialItemCount: 4,
            ),
          )
        ],
      ),
    );
  }
}
