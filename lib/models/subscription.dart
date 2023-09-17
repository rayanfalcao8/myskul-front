import 'package:myskul/models/domain.dart';
import 'package:myskul/models/level.dart';
import 'package:myskul/models/speciality.dart';

class Subscription {
  int? id;
  String? userId;
  String? abonnementTypeId;
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
    userId,
    abonnementTypeId,
    transactionID,
    buyerPhoneNumber,
    levelId,
    specialityId,
    domainId,
  });

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "abonnementType_id": abonnementTypeId,
      "transactionID": transactionID,
      "buyerPhoneNumber": buyerPhoneNumber,
      "level_id": levelId,
      "speciality_id": specialityId,
      "domain_id": domainId
    };
  }

  Subscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    abonnementTypeId = json['abonnementType_id'];
    transactionID = json['transactionID'];
    buyerPhoneNumber = json['buyerPhoneNumber'];
    levelId = json['level_id'];
    specialityId = json['speciality_id'];
    domainId = json['domain_id'];
    domain = Domain.fromJson(json['domain']);
    speciality = Speciality.fromJson(json['speciality']);
    level = Level.fromJson(json['level']);
    createdAt =
        json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
    updatedAt =
        json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null;
  }
}
