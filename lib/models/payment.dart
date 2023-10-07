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

class PaymentMethod {
  int? serviceid;
  String? merchant;
  String? payItemId;
  String? amountType;
  String? localCur;
  String? name;
  String? description;

  PaymentMethod({
    this.serviceid,
    this.merchant,
    this.payItemId,
    this.amountType,
    this.localCur,
    this.name,
    this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      "serviceid": serviceid,
      "merchant": merchant,
      "payItemId": payItemId,
      "amountType": amountType,
      "localCur": localCur,
      "name": name,
      "description": description,
    };
  }

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    serviceid = json['serviceid'];
    merchant = json['merchant'];
    payItemId = json['payItemId'];
    amountType = json['amountType'];
    localCur = json['localCur'];
    name = json['name'];
    description = json['description'];
  }
}
