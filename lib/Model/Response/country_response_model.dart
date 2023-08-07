// To parse this JSON data, do
//
//     final countryResponseModel = countryResponseModelFromJson(jsonString);

import 'dart:convert';

CountryResponseModel countryResponseModelFromJson(String str) => CountryResponseModel.fromJson(json.decode(str));

String countryResponseModelToJson(CountryResponseModel data) => json.encode(data.toJson());

class CountryResponseModel {
  String status;
  String message;
  List<Datum> data;

  CountryResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CountryResponseModel.fromJson(Map<String, dynamic> json) => CountryResponseModel(
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
