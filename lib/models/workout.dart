class Workout {
  int? id;
  String? title;
  String? description;
  int? seconds;
  int? reps;
  String? picture;
  DateTime? createdAt;
  DateTime? updatedAt;

  Workout({
    required this.title,
    this.reps,
    this.seconds,
    this.description,
    this.picture,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'seconds': seconds,
      'picture': picture,
      'reps': reps
    };
  }

  Workout.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    seconds = json['seconds'];
    picture = json['picture'];
    reps = json['reps'];
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
    updatedAt =
        json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null;
  }
}
