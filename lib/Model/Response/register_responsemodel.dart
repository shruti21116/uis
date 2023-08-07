// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

import 'dart:convert';


RegisterResponseModel registerResponseModelFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) => json.encode(data.toJson());



class RegisterResponseModel {
  String status;
  String message;
  Data? data;

  RegisterResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
    status: json["status"],
    message: json["message"],
    data: json["data"].toString().contains('}')?Data.fromJson(json["data"]):null,
  );


  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String name;
  String email;
  int roleId;
  String status;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Data({
    required this.name,
    required this.email,
    required this.roleId,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    roleId: json["role_id"],
    status: json["status"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "role_id": roleId,
    "status": status,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
