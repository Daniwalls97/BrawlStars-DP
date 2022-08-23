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
