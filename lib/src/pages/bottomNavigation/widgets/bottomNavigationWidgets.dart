import 'package:brawlstars/src/pages/blog/blog_page.dart';
import 'package:brawlstars/src/pages/brawlers/brawlers_page.dart';
import 'package:brawlstars/src/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidgets {
  static const List<Widget> bottomNavigationOptions = <Widget>[
    HomePage(),
    BrawlersPage(),
    BlogPage(),
  ];

  static const bottomNavigationItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_pin_rounded),
      label: 'Brawlers',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.web_rounded),
      label: 'Blog',
    ),
  ];
}
