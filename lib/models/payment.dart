class Payment {
  int? id;
  String? serviceId;
  String? amount;
  String? phoneNumber;
  DateTime? createdAt;
  DateTime? updatedAt;

  Payment({
    this.serviceId,
    this.amount,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      "serviceId": serviceId,
      "amount": amount,
      "phoneNumber": phoneNumber
    };
  }

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceId = json['serviceId'];
    amount = json['amount'];
    phoneNumber = json['phoneNumber'];
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
    updatedAt =
        json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null;
  }
}
