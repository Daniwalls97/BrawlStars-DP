import 'dart:convert';

import 'package:brawlstars/src/models/brawler/class.dart';
import 'package:brawlstars/src/models/brawler/gadget.dart';
import 'package:brawlstars/src/models/brawler/rarity.dart';
import 'package:brawlstars/src/models/brawler/video.dart';

Brawlers brawlersFromJson(String str) => Brawlers.fromJson(json.decode(str));

String welcomeToJson(Brawlers data) => json.encode(data.toJson());

class Brawlers {
  Brawlers({
    required this.list,
  });

  List<Brawler> list;

  factory Brawlers.fromJson(Map<String, dynamic> json) => Brawlers(
        list: List<Brawler>.from(json["list"].map((x) => Brawler.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class Brawler {
  Brawler({
    required this.id,
    required this.avatarId,
    required this.name,
    required this.hash,
    required this.path,
    required this.released,
    required this.version,
    required this.link,
    required this.imageUrl,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.listClass,
    required this.rarity,
    required this.unlock,
    required this.description,
    required this.starPowers,
    required this.gadgets,
    required this.videos,
  });

  int id;
  int avatarId;
  String name;
  String hash;
  String path;
  bool released;
  int version;
  String link;
  String imageUrl;
  String imageUrl2;
  String imageUrl3;
  Class listClass;
  Rarity rarity;
  dynamic unlock;
  String description;
  List<Gadget> starPowers;
  List<Gadget> gadgets;
  List<Video> videos;

  factory Brawler.fromJson(Map<String, dynamic> json) => Brawler(
        id: json["id"],
        avatarId: json["avatarId"]!,
        name: json["name"],
        hash: json["hash"],
        path: json["path"],
        released: json["released"],
        version: json["version"],
        link: json["link"],
        imageUrl: json["imageUrl"],
        imageUrl2: json["imageUrl2"],
        imageUrl3: json["imageUrl3"],
        listClass: Class.fromJson(json["class"]),
        rarity: Rarity.fromJson(json["rarity"]),
        unlock: json["unlock"],
        description: json["description"] ?? "Not yet...",
        starPowers: List<Gadget>.from(
            json["starPowers"].map((x) => Gadget.fromJson(x))),
        gadgets:
            List<Gadget>.from(json["gadgets"].map((x) => Gadget.fromJson(x))),
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatarId": avatarId,
        "name": name,
        "hash": hash,
        "path": path,
        "released": released,
        "version": version,
        "link": link,
        "imageUrl": imageUrl,
        "imageUrl2": imageUrl2,
        "imageUrl3": imageUrl3,
        "class": listClass.toJson(),
        "rarity": rarity.toJson(),
        "unlock": unlock,
        "description": description,
        "starPowers": List<dynamic>.from(starPowers.map((x) => x.toJson())),
        "gadgets": List<dynamic>.from(gadgets.map((x) => x.toJson())),
        "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
      };
}
