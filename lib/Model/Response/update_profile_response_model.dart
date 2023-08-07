// To parse this JSON data, do
//
//     final updateProfileResponseModel = updateProfileResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileResponseModel updateProfileResponseModelFromJson(String str) => UpdateProfileResponseModel.fromJson(json.decode(str));

String updateProfileResponseModelToJson(UpdateProfileResponseModel data) => json.encode(data.toJson());

class UpdateProfileResponseModel {
  String status;
  String message;
  Data? data;

  UpdateProfileResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) => UpdateProfileResponseModel(
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
  int formId;

  Data({
    required this.formId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    formId: json["form_id"],
  );

  Map<String, dynamic> toJson() => {
    "form_id": formId,
  };
}
