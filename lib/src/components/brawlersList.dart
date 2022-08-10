import 'package:brawlstars/src/api/api_services.dart';
import 'package:brawlstars/src/models/brawlers.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class BrawlersList extends StatefulWidget {
  const BrawlersList({Key? key}) : super(key: key);

  @override
  _BrawlersListStage createState() => _BrawlersListStage();
}

class _BrawlersListStage extends State<BrawlersList> {
  late List<Brawler>? _brawlerList = [];
  late List<Brawler>? _brawlerShowList = [];
  bool showSearchBar = false;

  static const TextStyle loadingStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      fontFamily: 'Nougat',
      color: Colors.amber);
  static const TextStyle titleStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontFamily: 'Nougat',
      color: Colors.black);
  static const TextStyle titleStyleDialog = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontFamily: 'Nougat',
      color: Colors.white);

  static const TextStyle buttonStyleType = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Nougat',
      fontSize: 20,
      color: Colors.black);

  static const TextStyle buttonStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Nougat',
      fontSize: 20,
      color: Colors.white);

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _brawlerList = (await ApiService().getBrawlers())!;
    _brawlerList?.sort((a, b) {
      return a.rarity.id.compareTo(b.rarity.id);
    });
    _brawlerShowList = _brawlerList;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final controllerInput = TextEditingController();

    return Scaffold(
        appBar: showSearchBar
            ? AppBar(
                backgroundColor: Colors.grey[800],
                title: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.black),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear, color: Colors.black),
                            onPressed: () {
                              setState(() {
                                showSearchBar = !showSearchBar;
                              });
                            },
                          ),
                          hintText: 'Search brawler...',
                          border: InputBorder.none),
                      onChanged: (value) => {searchBrawler(value)},
                    ),
                  ),
                ))
            : null,
        backgroundColor: Colors.black,
        body: _brawlerList == null || _brawlerList!.isEmpty
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 24 / 8,
                      child: Image.asset("assets/img/loading_genio.gif"),
                    ),
                    const Text(
                      "Loading...",
                      style: loadingStyle,
                    )
                  ],
                ),
              )
            : Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/ruff.jpg"),
                      fit: BoxFit.cover,
                      opacity: 0.4),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 0.0),
                  child: GridView.count(
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(16.0),
                      childAspectRatio: 8.0 / 8.0,
                      children:
                          _buildGridCards(context, _brawlerShowList!) // Replace
                      ),
                )),
        floatingActionButton: _brawlerList == null || _brawlerList!.isEmpty
            ? FloatingActionButton(
                backgroundColor: Colors.black, onPressed: () {})
            : SpeedDial(
                icon: Icons.search,
                backgroundColor: const Color.fromARGB(255, 228, 111, 249),
                activeIcon: Icons.close,
                activeBackgroundColor: Colors.grey[800],
                children: [
                    SpeedDialChild(
                      backgroundColor: const Color.fromARGB(255, 228, 111, 249),
                      child: const Icon(
                        Icons.list,
                        color: Colors.white,
                      ),
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              color: Colors.grey[800],
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        TextButton(
                                          child: Text("All types",
                                              style: buttonStyleType), // 0
                                          style: TextButton.styleFrom(
                                            minimumSize:
                                                const Size.fromHeight(40),
                                            backgroundColor: Colors.grey[300],
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _brawlerShowList = _brawlerList;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        CategoryButton(
                                            "Trophy Road", "#b9eaff", 1),
                                        CategoryButton("Rare", "#68fd58", 2),
                                        CategoryButton(
                                            "Super Rare", "#5ab3ff", 3),
                                        CategoryButton("Epic", "#d850ff", 4),
                                        CategoryButton("Mythic", "#fe5e72", 5),
                                        CategoryButton(
                                            "Legendary", "#fff11e", 6),
                                        CategoryButton(
                                            "Chromatic", "#f88f25", 7)
                                      ],
                                    ),
                                    ElevatedButton(
                                      child: Text("CANCEL", style: buttonStyle),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    SpeedDialChild(
                        backgroundColor:
                            const Color.fromARGB(255, 228, 111, 249),
                        child: const Icon(
                          Icons.text_fields,
                          color: Colors.white,
                        ),
                        onTap: () {
                          setState(() {
                            showSearchBar = !showSearchBar;
                          });
                        })
                  ]));
  }

  void searchBrawler(String query) {
    final foundBrawlers = _brawlerList
        ?.where((brawler) =>
            brawler.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      _brawlerShowList = foundBrawlers;
    });
  }

  Widget CategoryButton(String text, String hex, id) {
    return TextButton(
      child: Text(text, style: buttonStyleType), // 6
      style: TextButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
          backgroundColor: HexColor(hex)),
      onPressed: () {
        setState(() {
          _brawlerShowList =
              _brawlerList?.where((i) => i.rarity.id == id).toList();
        });
        Navigator.of(context).pop();
      },
    );
  }

  List<Card> _buildGridCards(BuildContext context, List<Brawler> list) {
    if (list.isEmpty) {
      return const <Card>[];
    }

    return list.map((brawler) {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        elevation: 20,
        color: HexColor(brawler.rarity.color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Colors.white.withOpacity(0.4),
            width: 3,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Hero(
          tag: brawler.id,
          child: Column(
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
                      image: NetworkImage(brawler.imageUrl),
                      fit: BoxFit.cover,
                      height: 50,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'detailPage',
                          arguments: brawler);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        brawler.name,
                        maxLines: 1,
                        style: titleStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
