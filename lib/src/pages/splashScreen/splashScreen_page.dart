import 'package:brawlstars/src/pages/splashScreen/widgets/splashScreenWidgets.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    var duration = SplashScreenWidgets.splashDuration;
    Future.delayed(duration, () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return SplashScreenWidgets.returnPage;
      }), (route) => false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Container(decoration: SplashScreenWidgets.wallpaper)],
      ),
    );
  }
}
