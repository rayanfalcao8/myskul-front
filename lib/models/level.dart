class Level {
  int? id;
  String? level;
  DateTime? createdAt;
  DateTime? updatedAt;

  Level({level});

  Map<String, dynamic> toJson() {
    return {
      'level': level,
    };
  }

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
    updatedAt =
        json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null;
  }
}
