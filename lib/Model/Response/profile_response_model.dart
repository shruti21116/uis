// To parse this JSON data, do
//
//     final profileResponseModel = profileResponseModelFromJson(jsonString);

import 'dart:convert';

ProfileResponseModel profileResponseModelFromJson(String str) => ProfileResponseModel.fromJson(json.decode(str));

String profileResponseModelToJson(ProfileResponseModel data) => json.encode(data.toJson());

class ProfileResponseModel {
  String status;
  String message;
  Data? data;

  ProfileResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => ProfileResponseModel(
    status: json["status"],
    message: json["message"],
    data:json["data"].length<1?null: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int id;
  int roleId;
  String name;
  String email;
  int phone;
  dynamic profileUrl;
  dynamic location;
  dynamic aboutMe;
  dynamic countryId;
  dynamic stateId;
  dynamic cityId;
  String status;
  dynamic statusChangedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int createdBy;

  Data({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.phone,
    this.profileUrl,
    this.location,
    this.aboutMe,
    this.countryId,
    this.stateId,
    this.cityId,
    required this.status,
    this.statusChangedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    roleId: json["role_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    profileUrl: json["profile_url"]??"",
    location: json["location"]??"",
    aboutMe: json["about_me"]??"",
    countryId: json["country_id"]??"",
    stateId: json["state_id"]??"",
    cityId: json["city_id"]??"",
    status: json["status"],
    statusChangedBy: json["status_changed_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdBy: json["created_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role_id": roleId,
    "name": name,
    "email": email,
    "phone": phone,
    "profile_url": profileUrl,
    "location": location,
    "about_me": aboutMe,
    "country_id": countryId,
    "state_id": stateId,
    "city_id": cityId,
    "status": status,
    "status_changed_by": statusChangedBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "created_by": createdBy,
  };
}
