import 'package:myskul/models/domain.dart';
import 'package:myskul/models/level.dart';
import 'package:myskul/models/speciality.dart';

class Subscription {
  int? id;
  String? userId;
  String? amount;
  String? abonnementTypeId;
  String? type;
  String? serviceId;
  String? transactionID;
  String? buyerPhoneNumber;
  String? levelId;
  String? specialityId;
  String? domainId;
  Domain? domain;
  Speciality? speciality;
  Level? level;
  DateTime? createdAt;
  DateTime? updatedAt;

  Subscription({
    this.userId,
    required this.type,
    required this.amount,
    this.transactionID,
    this.buyerPhoneNumber,
    required this.levelId,
    required this.specialityId,
    required this.domainId,
<<<<<<< HEAD
    required this.serviceId,
=======
    // required this.serviceId,
>>>>>>> a913078 (Add phone validator)
  });

  Map<String, String?> toJson() {
    return {
      "domain_id": domainId,
      "type": type,
      "level_id": levelId,
      "speciality_id": specialityId,
      "serviceId": serviceId,
      "amount": amount,
      "phoneNumber": buyerPhoneNumber,
    };
  }

  Subscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = (json['user_id']).toString();
    abonnementTypeId = json['abonnementType_id'];
    transactionID = json['transactionID'];
    buyerPhoneNumber = json['buyerPhoneNumber'];
    levelId = json['level_id'];
    specialityId = json['speciality_id'];
    domainId = json['domain_id'];
    domain = json['domain'] != null ? Domain.fromJson(json['domain']) : null;
    speciality = json['speciality'] != null
        ? Speciality.fromJson(json['speciality'])
        : null;
    level = Level.fromJson(json['level']);
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
  }
}
