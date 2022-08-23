import 'package:brawlstars/src/pages/bottomNavigation/widgets/bottomNavigationWidgets.dart';
import 'package:brawlstars/src/utils/colors.dart';
import 'package:brawlstars/src/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      body: Center(
          child: BottomNavigationWidgets.bottomNavigationOptions
              .elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: BottomNavigationWidgets.bottomNavigationItems,
        currentIndex: _selectedIndex,
        selectedItemColor: CustomColors.primaryPink,
        selectedLabelStyle: Styles.navBarTitlesStyle,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: Styles.navBarTitlesStyle,
        backgroundColor: Colors.grey[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
