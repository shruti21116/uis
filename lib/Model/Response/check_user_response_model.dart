// To parse this JSON data, do
//
//     final checkUserResponseModel = checkUserResponseModelFromJson(jsonString);

import 'dart:convert';

CheckUserResponseModel checkUserResponseModelFromJson(String str) => CheckUserResponseModel.fromJson(json.decode(str));

String checkUserResponseModelToJson(CheckUserResponseModel data) => json.encode(data.toJson());

class CheckUserResponseModel {
  String status;
  String message;
  Data? data;

  CheckUserResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CheckUserResponseModel.fromJson(Map<String, dynamic> json) => CheckUserResponseModel(
    status: json["status"],
    message: json["message"],
    data:json["data"].length<1 ? null:Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String status;

  Data({
    required this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["status"],
  );


  Map<String, dynamic> toJson() => {
    "status": status,
  };
}
