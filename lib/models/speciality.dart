class Speciality {
  int? id;
  String? sigle;
  String? speciality;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;

  Speciality({sigle, speciality, type});

  Map<String, dynamic> toJson() {
    return {
      'sigle': sigle,
      'speciality': speciality,
      'type': type,
    };
  }

  Speciality.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sigle = json['sigle'];
    speciality = json['speciality'];
    type = json['type'];
    createdAt = json['created_at'] != null ? json['created_at'] : null;
    updatedAt = json['updated_at'] != null ? json['updated_at'] : null;
  }
}
