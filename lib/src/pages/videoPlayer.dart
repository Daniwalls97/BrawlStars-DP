import 'dart:async';

import 'package:brawlstars/src/models/brawlers.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Video brawlerVideo =
        ModalRoute.of(context)!.settings.arguments as Video;
    const TextStyle appBarTitlesStyle =
        TextStyle(fontFamily: 'Nougat', fontSize: 20);
    const TextStyle titlesStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Nougat',
        fontSize: 30,
        color: Colors.white);
    const TextStyle descriptionStyle =
        TextStyle(fontFamily: 'Nougat', fontSize: 20, color: Colors.white);

    _controller = VideoPlayerController.network(
      brawlerVideo.videoUrl,
    );

    // Inicializa el controlador y almacena el Future para utilizarlo luego
    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);

    _controller.play();

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: const Text(
            "VIDEO GALLERY",
            style: appBarTitlesStyle,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  Share.share(brawlerVideo.videoUrl);
                })
          ],
        ),
        // Usa un FutureBuilder para visualizar un spinner de carga mientras espera a que
        // la inicialización de VideoPlayerController finalice.
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    brawlerVideo.name,
                    style: titlesStyle,
                  ),
                ),
                FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // Si el VideoPlayerController ha finalizado la inicialización, usa
                      // los datos que proporciona para limitar la relación de aspecto del VideoPlayer
                      return AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          // Usa el Widget VideoPlayer para mostrar el vídeo
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: VideoPlayer(_controller))));
                    } else {
                      // Si el VideoPlayerController todavía se está inicializando, muestra un
                      // spinner de carga
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 228, 111, 249),
                      ));
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    brawlerVideo.description,
                    style: descriptionStyle,
                  ),
                ),
              ],
            ),
          ),
        ) // Esta coma final hace que el formateo automático sea mejor para los métodos de compilación.
        );
  }
}
