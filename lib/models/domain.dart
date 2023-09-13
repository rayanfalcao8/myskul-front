class Domain {
  int? id;
  String? name;
  String? displayName;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  Domain({name, displayName, description});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "display_name": displayName,
      "description": description
    };
  }

  Domain.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['display_name'];
    description = json['description'];
    createdAt = json['created_at'] != null ? json['created_at'] : null;
    updatedAt = json['updated_at'] != null ? json['updated_at'] : null;
  }
}
