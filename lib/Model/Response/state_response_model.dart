// To parse this JSON data, do
//
//     final stateResponseModel = stateResponseModelFromJson(jsonString);

import 'dart:convert';

StateResponseModel stateResponseModelFromJson(String str) => StateResponseModel.fromJson(json.decode(str));

String stateResponseModelToJson(StateResponseModel data) => json.encode(data.toJson());

class StateResponseModel {
  String status;
  String message;
  List<Datum> data;

  StateResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory StateResponseModel.fromJson(Map<String, dynamic> json) => StateResponseModel(
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
  String name;

  Datum({
    required this.id,
    required this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
