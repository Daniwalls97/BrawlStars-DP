import 'package:flutter/material.dart';
import '../../../utils/styles.dart';

class BrawlersWidgets {
  static const searchIcon = Icon(Icons.search, color: Colors.black);
  static const closeIcon = Icon(Icons.clear, color: Colors.black);
  static const listIcon = Icon(
    Icons.list,
    color: Colors.white,
  );

  static const wallpaper = BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/img/ruff.jpg"),
        fit: BoxFit.cover,
        opacity: 0.4),
  );

  static const allTypesText = Text("All types", style: Styles.buttonStyleType);
  static const cancelText = Text("CANCEL", style: Styles.buttonStyle);
}
