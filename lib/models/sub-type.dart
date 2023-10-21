class SubscriptionType {
  int? id;
  String? category;
  String? timeUnit;
  String? duration;
  String? amount_prepa;
  String? amount_bord;
  DateTime? createdAt;
  DateTime? updatedAt;

  SubscriptionType({
    this.category,
    this.timeUnit,
    this.duration,
    this.amount_bord,
    this.amount_prepa,
  });

  Map<String, dynamic> toJson() {
    return {
      "category": category,
      "timeUnit": timeUnit,
      "duration": duration,
      "amount_bord": amount_bord,
      "amount_prepa": amount_prepa,
    };
  }

  SubscriptionType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    timeUnit = json['timeUnit'];
    duration = json['duration'];
    amount_bord = json['amount_bord'];
    amount_prepa = json['amount_prepa'];
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
    updatedAt =
        json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null;
  }
}
