import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:brawlstars/src/models/brawlers.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BrawlerDetail extends StatelessWidget {
  const BrawlerDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brawler brawler =
        ModalRoute.of(context)!.settings.arguments as Brawler;
    const TextStyle appBarTitlesStyle = TextStyle(
        fontWeight: FontWeight.bold, fontFamily: 'Nougat', fontSize: 30);

    const TextStyle descriptionStyle = TextStyle(color: Colors.white);
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          brawler.name,
          style: appBarTitlesStyle,
        ),
        backgroundColor: Colors.grey[800],
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.video_library_outlined),
              onPressed: () {
                if (brawler.videos.isNotEmpty) {
                  Navigator.pushNamed(context, 'videoPage',
                      arguments: brawler.videos[0]);
                } else {
                  showAlertDialog(context);
                }
              }),
          IconButton(
              icon: const Icon(Icons.video_library_rounded),
              onPressed: () {
                if (brawler.videos.isNotEmpty) {
                  Navigator.pushNamed(context, 'videoPage',
                      arguments: brawler.videos[1]);
                } else {
                  showAlertDialog(context);
                }
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 150.0,
              ),
              _Image(brawler),
              _Title(brawler),
              _Description(brawler),
              brawler.starPowers.isNotEmpty
                  ? Column(children: <Widget>[
                      _SubTitle("Star Powers", "#e8de1c", "#e3db40", "#e6df5a",
                          "#918a0a"),
                      _Skill(brawler.starPowers[0]),
                      brawler.starPowers.length > 1
                          ? _Skill(brawler.starPowers[1])
                          : const Text("")
                    ])
                  : const Text(""),
              brawler.starPowers.isNotEmpty
                  ? Column(children: <Widget>[
                      _SubTitle("Gadgets", "#36c928", "#49cf3c", "#63d158",
                          "#138508"),
                      _Skill(brawler.gadgets[0]),
                      brawler.gadgets.length > 1
                          ? _Skill(brawler.gadgets[1])
                          : const Text("")
                    ])
                  : const Text("")
            ],
          ),
        ),
      ),
    );
  }

  List<Card> _buildGridSkills(BuildContext context, List<Gadget> list) {
    if (list.isEmpty) {
      return const <Card>[];
    }

    return list.map((gadget) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Colors.white.withOpacity(0.4),
            width: 3,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 14 / 12,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: GestureDetector(
                  child: FadeInImage(
                    placeholder:
                        const AssetImage('assets/img/loading_leon.gif'),
                    image: NetworkImage(gadget.imageUrl),
                    fit: BoxFit.cover,
                    height: 50,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      gadget.name,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      gadget.description,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}

Widget _Skill(Gadget gadget) {
  const TextStyle titleStyle =
      TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Nougat');
  const TextStyle descriptionStyle = TextStyle(color: Colors.white);

  return Center(
      child: Container(
    color: Colors.grey[800],
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: FadeInImage(
              placeholder: const AssetImage('assets/img/loading_leon.gif'),
              image: NetworkImage(gadget.imageUrl),
              fit: BoxFit.cover,
              width: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Center(
                child: Column(
              children: [
                Container(
                  width: 250,
                  child: Text(
                    gadget.name,
                    style: titleStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                    width: 250,
                    child: Text(
                      gadget.description,
                      style: descriptionStyle,
                      textAlign: TextAlign.left,
                    ))
              ],
            )),
          )
        ],
      ),
    ),
  ));
}

Widget _Description(Brawler brawler) {
  const TextStyle descriptionStyle = TextStyle(color: Colors.white);

  return Padding(
    padding:
        const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0, bottom: 30.0),
    child: Text(
      brawler.description,
      textAlign: TextAlign.center,
      style: descriptionStyle,
    ),
  );
}

Widget _Image(Brawler brawler) {
  Color brawlColor = HexColor(brawler.rarity.color);

  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: brawlColor,
          spreadRadius: 5,
          blurRadius: 20,
          offset: const Offset(0, 0), // changes position of shadow
        ),
      ],
    ),
    child: Hero(
      tag: brawler.id,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: FadeInImage(
          placeholder: const AssetImage('assets/img/loading_leon.gif'),
          image: NetworkImage(brawler.imageUrl2),
          height: 150,
        ),
      ),
    ),
  );
}

Widget _Title(Brawler brawler) {
  const TextStyle titlesStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Nougat',
      fontSize: 50,
      color: Colors.white);

  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Text(
      brawler.name,
      style: titlesStyle,
    ),
  );
}

Widget _SubTitle(
    String text, String color, String color1, String color2, String color3) {
  TextStyle titlesStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Nougat',
      fontSize: 35,
      color: HexColor(color));

  var colorizeColors = [
    HexColor(color),
    HexColor(color1),
    HexColor(color2),
    HexColor(color3),
  ];

  const colorizeTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 35.0,
    fontFamily: 'Nougat',
  );

  return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: AnimatedTextKit(
        repeatForever: true,
        animatedTexts: [
          ColorizeAnimatedText(
            text,
            textStyle: colorizeTextStyle,
            colors: colorizeColors,
          ),
        ],
      ));
}

showAlertDialog(BuildContext context) {
  const TextStyle titlesStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Nougat',
      fontSize: 30,
      color: Colors.white);
  const TextStyle buttonStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Nougat',
      fontSize: 20,
      color: Colors.white);
  const TextStyle descriptionStyle = TextStyle(color: Colors.white);
  // Create button
  Widget okButton = TextButton(
    child: Text("OK", style: buttonStyle),
    style:
        ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.grey[800],
    title: const Text(
      "Ops",
      style: titlesStyle,
    ),
    content: const Text(
      "No video for this brawler 😭",
      style: descriptionStyle,
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
