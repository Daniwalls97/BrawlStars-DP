import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:brawlstars/src/utils/styles.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/wallpaper.png"),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  "Welcome to...",
                  style: Styles.homeTitleStyle,
                  textAlign: TextAlign.center,
                ),
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
