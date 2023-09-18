class SubscriptionType {
  int? id;
  String? category;
  String? timeUnit;
  String? duration;
  DateTime? createdAt;
  DateTime? updatedAt;

  SubscriptionType({
    this.category,
    this.timeUnit,
    this.duration,
  });

  Map<String, dynamic> toJson() {
    return {
      "category": category,
      "timeUnit": timeUnit,
      "duration": duration,
    };
  }

  SubscriptionType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    timeUnit = json['timeUnit'];
    duration = json['duration'];
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
    updatedAt =
        json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null;
  }
}
