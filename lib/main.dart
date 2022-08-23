import 'package:brawlstars/src/pages/brawlers/brawlerDetail/brawlerDetail_page.dart';
import 'package:brawlstars/src/pages/brawlers/videoGallery/videoGallery_page.dart';
import 'package:brawlstars/src/pages/splashScreen/splashScreen_page.dart';
import 'package:flutter/material.dart';

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
        '/': (context) => const SplashScreenPage(),
        'detailPage': (context) => const BrawlerDetailPage(),
        'videoPage': (context) => const VideoGalleryPage()
      },
    );
  }
}
