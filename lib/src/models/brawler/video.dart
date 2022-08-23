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
