import 'package:flutter/material.dart';
import '../../bottomNavigation/bottomNavigation_page.dart';

class SplashScreenWidgets {
  static const splashDuration = Duration(seconds: 3);
  static const returnPage = BottomNavigationPage();

  static const wallpaper = BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/img/splashBackground.png"),
        fit: BoxFit.cover),
  );
}
