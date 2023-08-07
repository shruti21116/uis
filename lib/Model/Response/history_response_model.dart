// To parse this JSON data, do
//
//     final historyResponseModel = historyResponseModelFromJson(jsonString);

import 'dart:convert';

HistoryResponseModel historyResponseModelFromJson(String str) => HistoryResponseModel.fromJson(json.decode(str));

String historyResponseModelToJson(HistoryResponseModel data) => json.encode(data.toJson());

class HistoryResponseModel {
  String status;
  String message;
  List<Datum> data;

  HistoryResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HistoryResponseModel.fromJson(Map<String, dynamic> json) => HistoryResponseModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String numberOnUisBand;
  int countryId;
  int stateId;
  String deceasedName;
  DateTime dateOfDeath;
  String placeOfDeath;
  String phoneNumber;
  String pictureOfNumberOnBand;
  String nameSecuringBand;
  DateTime dateTimeAttached;
  String nameOfFuneralDirector;
  String addressOfFuneralHome;
  String nameFuneralDirectorOtherRepresentativeTakingCustodyEsign;
  DateTime nameFuneralDirectorOtherRepresentativeTakingCustodyDt;
  String nameCrematoryCemeteryRepresentativeCustodyDeceasedEsign;
  DateTime nameCrematoryCemeteryRepresentativeCustodyDeceasedDt;
  String nameOfPersonEntitledToReceiveCrematedRemainsEsign;
  String nameOfPersonEntitledToReceiveCrematedRemainsRelationship;
  DateTime nameOfPersonEntitledToReceiveCrematedRemainsDt;
  String nameOfPersonReleasingCrematedRemainsEsign;
  DateTime nameOfPersonReleasingCrematedRemainsDt;
  String status;
  dynamic randomNumber;
  dynamic qrCodeImage;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.numberOnUisBand,
    required this.countryId,
    required this.stateId,
    required this.deceasedName,
    required this.dateOfDeath,
    required this.placeOfDeath,
    required this.phoneNumber,
    required this.pictureOfNumberOnBand,
    required this.nameSecuringBand,
    required this.dateTimeAttached,
    required this.nameOfFuneralDirector,
    required this.addressOfFuneralHome,
    required this.nameFuneralDirectorOtherRepresentativeTakingCustodyEsign,
    required this.nameFuneralDirectorOtherRepresentativeTakingCustodyDt,
    required this.nameCrematoryCemeteryRepresentativeCustodyDeceasedEsign,
    required this.nameCrematoryCemeteryRepresentativeCustodyDeceasedDt,
    required this.nameOfPersonEntitledToReceiveCrematedRemainsEsign,
    required this.nameOfPersonEntitledToReceiveCrematedRemainsRelationship,
    required this.nameOfPersonEntitledToReceiveCrematedRemainsDt,
    required this.nameOfPersonReleasingCrematedRemainsEsign,
    required this.nameOfPersonReleasingCrematedRemainsDt,
    required this.status,
    this.randomNumber,
    this.qrCodeImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    numberOnUisBand: json["number_on_uis_band"] ?? "",
    countryId: json["country_id"],
    stateId: json["state_id"] ?? "",
    deceasedName: json["deceased_name"],
    dateOfDeath: DateTime.parse(json["date_of_death"]),
    placeOfDeath: json["place_of_death"],
    phoneNumber: json["phone_number"],
    pictureOfNumberOnBand: json["picture_of_number_on_band"],
    nameSecuringBand: json["name_securing_band"],
    dateTimeAttached: DateTime.parse(json["date_time_attached"]),
    nameOfFuneralDirector: json["name_of_funeral_director"],
    addressOfFuneralHome: json["address_of_funeral_home"],
    nameFuneralDirectorOtherRepresentativeTakingCustodyEsign: json["name_funeral_director_other_representative_taking_custody_esign"],
    nameFuneralDirectorOtherRepresentativeTakingCustodyDt: DateTime.parse(json["name_funeral_director_other_representative_taking_custody_dt"]),
    nameCrematoryCemeteryRepresentativeCustodyDeceasedEsign: json["name_crematory_cemetery_representative_custody_deceased_esign"],
    nameCrematoryCemeteryRepresentativeCustodyDeceasedDt: DateTime.parse(json["name_crematory_cemetery_representative_custody_deceased_dt"]),
    nameOfPersonEntitledToReceiveCrematedRemainsEsign: json["name_of_person_entitled_to_receive_cremated_remains_esign"],
    nameOfPersonEntitledToReceiveCrematedRemainsRelationship: json["name_of_person_entitled_to_receive_cremated_remains_relationship"],
    nameOfPersonEntitledToReceiveCrematedRemainsDt: DateTime.parse(json["name_of_person_entitled_to_receive_cremated_remains_dt"]),
    nameOfPersonReleasingCrematedRemainsEsign: json["name_of_person_releasing_cremated_remains_esign"],
    nameOfPersonReleasingCrematedRemainsDt: DateTime.parse(json["name_of_person_releasing_cremated_remains_dt"]),
    status: json["status"],
    randomNumber: json["random_number"]??"",
    qrCodeImage: json["qr_code_image"]??"",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number_on_uis_band": numberOnUisBand,
    "country_id": countryId,
    "state_id": stateId,
    "deceased_name": deceasedName,
    "date_of_death": "${dateOfDeath.year.toString().padLeft(4, '0')}-${dateOfDeath.month.toString().padLeft(2, '0')}-${dateOfDeath.day.toString().padLeft(2, '0')}",
    "place_of_death": placeOfDeath,
    "phone_number": phoneNumber,
    "picture_of_number_on_band": pictureOfNumberOnBand,
    "name_securing_band": nameSecuringBand,
    "date_time_attached": dateTimeAttached.toIso8601String(),
    "name_of_funeral_director": nameOfFuneralDirector,
    "address_of_funeral_home": addressOfFuneralHome,
    "name_funeral_director_other_representative_taking_custody_esign": nameFuneralDirectorOtherRepresentativeTakingCustodyEsign,
    "name_funeral_director_other_representative_taking_custody_dt": nameFuneralDirectorOtherRepresentativeTakingCustodyDt.toIso8601String(),
    "name_crematory_cemetery_representative_custody_deceased_esign": nameCrematoryCemeteryRepresentativeCustodyDeceasedEsign,
    "name_crematory_cemetery_representative_custody_deceased_dt": nameCrematoryCemeteryRepresentativeCustodyDeceasedDt.toIso8601String(),
    "name_of_person_entitled_to_receive_cremated_remains_esign": nameOfPersonEntitledToReceiveCrematedRemainsEsign,
    "name_of_person_entitled_to_receive_cremated_remains_relationship": nameOfPersonEntitledToReceiveCrematedRemainsRelationship,
    "name_of_person_entitled_to_receive_cremated_remains_dt": nameOfPersonEntitledToReceiveCrematedRemainsDt.toIso8601String(),
    "name_of_person_releasing_cremated_remains_esign": nameOfPersonReleasingCrematedRemainsEsign,
    "name_of_person_releasing_cremated_remains_dt": nameOfPersonReleasingCrematedRemainsDt.toIso8601String(),
    "status": status,
    "random_number": randomNumber,
    "qr_code_image": qrCodeImage,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
