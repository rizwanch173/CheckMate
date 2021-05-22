import 'package:checkmate/pages/Home.dart';
import 'package:checkmate/pages/Login.dart';
import 'package:checkmate/pages/Profile.dart';
import 'package:checkmate/pages/Singup.dart';
import 'package:checkmate/pages/Swip.dart';
import 'package:checkmate/pages/Temp.dart';
import 'package:checkmate/pages/Upload.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _pageIndex = 0;
  static int id = 0;
  static String xxx = "1";
  static bool isloginclicked = false;
  static bool issignupclicked = false;
  static bool isprofileclicked = false;
  static GlobalKey _bottomNavigationKey = new GlobalKey();
  final CurvedNavigationBar navigationBar = _bottomNavigationKey.currentWidget;

  List pages = [
    MyRoute(
      iconData: Icons.home,
      page: Home(),
    ),
    MyRoute(
      iconData: Icons.swap_horiz,
      page: Swip(),
    ),
    MyRoute(
      iconData: Icons.add_circle_outline,
      page: Upload(),
    ),
    MyRoute(
      iconData: Icons.search,
      page: Singup(),
    ),
    MyRoute(
      iconData: Icons.person,
      page: Profile(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_pageIndex].page,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
//        color: Color(0xFFFB415B),
        color: Theme.of(context).accentColor,
        backgroundColor: Colors.white,
        index: _pageIndex,
        buttonBackgroundColor: Colors.greenAccent,
        height: 50,
        items: pages
            .map((p) => Icon(
                  p.iconData,
                  size: 30,
                ))
            .toList(),
        animationDuration: Duration(microseconds: 300000),
        // animationCurve: Curves.easeInCubic,
        onTap: (index) {
          setState(() {
            print(isloginclicked);
            print(issignupclicked);
            // initState();
            _pageIndex = index;
            isloginclicked = false;
            issignupclicked = false;
            isprofileclicked = false;
          });
        },
      ),
    );
  }
}

class MyRoute {
  final IconData iconData;
  final Widget page;

  MyRoute({this.iconData, this.page});
}
