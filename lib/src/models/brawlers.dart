import 'dart:convert';

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

class Gadget {
  Gadget({
    required this.id,
    required this.name,
    required this.path,
    required this.version,
    required this.description,
    required this.imageUrl,
    required this.released,
  });

  int id;
  String name;
  String path;
  int version;
  String description;
  String imageUrl;
  bool released;

  factory Gadget.fromJson(Map<String, dynamic> json) => Gadget(
        id: json["id"],
        name: json["name"],
        path: json["path"],
        version: json["version"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        released: json["released"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "path": path,
        "version": version,
        "description": description,
        "imageUrl": imageUrl,
        "released": released,
      };
}

class Class {
  Class({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Class.fromJson(Map<String, dynamic> json) => Class(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Rarity {
  Rarity({
    required this.id,
    required this.name,
    required this.color,
  });

  int id;
  String name;
  String color;

  factory Rarity.fromJson(Map<String, dynamic> json) => Rarity(
        id: json["id"],
        name: json["name"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
      };
}

class Video {
  Video({
    required this.type,
    required this.name,
    required this.description,
    required this.duration,
    required this.videoUrl,
    required this.previewUrl,
    required this.uploadDate,
  });

  int type;
  String name;
  String description;
  String duration;
  String videoUrl;
  String previewUrl;
  DateTime uploadDate;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        type: json["type"],
        name: json["name"],
        description: json["description"],
        duration: json["duration"],
        videoUrl: json["videoUrl"],
        previewUrl: json["previewUrl"],
        uploadDate: DateTime.parse(json["uploadDate"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "description": description,
        "duration": duration,
        "videoUrl": videoUrl,
        "previewUrl": previewUrl,
        "uploadDate": uploadDate.toIso8601String(),
      };
}
