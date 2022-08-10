import 'package:brawlstars/src/components/brawlerDetail.dart';
import 'package:brawlstars/src/components/brawlersList.dart';
import 'package:brawlstars/src/components/home.dart';
import 'package:brawlstars/src/components/webview.dart';
import 'package:brawlstars/src/pages/videoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Brawl Stars';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyStatefulWidget(),
        'detailPage': (context) => const BrawlerDetail(),
        'videoPage': (context) => const VideoPlayerScreen()
      },
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Nougat');
  static const TextStyle navBarTitlesStyle =
      TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Nougat');
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    BrawlersList(),
    WebViewExample(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 228, 111, 249),
        selectedLabelStyle: navBarTitlesStyle,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: navBarTitlesStyle,
        backgroundColor: Colors.grey[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
