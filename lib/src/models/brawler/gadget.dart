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
