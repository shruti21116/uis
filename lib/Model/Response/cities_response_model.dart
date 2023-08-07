// To parse this JSON data, do
//
//     final citiesResponseModel = citiesResponseModelFromJson(jsonString);

import 'dart:convert';

CitiesResponseModel citiesResponseModelFromJson(String str) => CitiesResponseModel.fromJson(json.decode(str));

String citiesResponseModelToJson(CitiesResponseModel data) => json.encode(data.toJson());

class CitiesResponseModel {
  String status;
  String message;
  List<Datum> data;

  CitiesResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CitiesResponseModel.fromJson(Map<String, dynamic> json) => CitiesResponseModel(
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
