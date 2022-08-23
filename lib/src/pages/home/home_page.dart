import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:brawlstars/src/pages/home/widgets/homeWidgets.dart';
import 'package:brawlstars/src/utils/styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: HomeWidgets.wallpaper,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                HomeWidgets.welcomeText,
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Brawl Stars',
                      textStyle: Styles.sunTitleStyle,
                      speed: const Duration(milliseconds: 1000),
                    ),
                  ],
                  totalRepeatCount: 4,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
                AspectRatio(
                  aspectRatio: 24 / 8,
                  child: Image.asset("assets/img/loading_lord_spike.gif"),
                ),
              ],
            ),
          )),
    );
  }
}
