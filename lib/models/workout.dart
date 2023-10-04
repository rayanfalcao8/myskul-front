class Workout {
  int? id;
  String? label;
  String? level;
  String? bodyPart;
  String? description;
  DateTime? duration;
  DateTime? reps;
  String? picture;
  DateTime? createdAt;
  DateTime? updatedAt;

  Workout({
    this.label,
    this.description,
    this.duration,
    this.picture,
    this.level,
    this.bodyPart,
    this.reps,
  });

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'description': description,
      'duration': duration!.toIso8601String(),
      'picture': picture,
      'level': level,
      'body_part': bodyPart,
      'reps': reps
    };
  }

  Workout.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    description = json['description'];
    duration =
        json['duration'] != null ? DateTime.parse(json['duration']) : null;
    picture = json['picture'];
    level = json['level'];
    bodyPart = json['body_part'];
    reps = json['reps'];
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
    updatedAt =
        json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null;
  }
}
