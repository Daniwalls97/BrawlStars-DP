import 'package:flutter/material.dart';
import '../../../utils/styles.dart';

class HomeWidgets {
  static const welcomeText = Text(
    "Welcome to...",
    style: Styles.homeTitleStyle,
    textAlign: TextAlign.center,
  );

  static const wallpaper = BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/img/wallpaper.png"), fit: BoxFit.cover),
  );
}
