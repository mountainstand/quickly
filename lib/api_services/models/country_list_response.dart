import 'package:flutter/foundation.dart';

@immutable
class CountryListResponse {
  final bool? success;
  final List<CountryModel>? data;
  final String? message;

  const CountryListResponse({
    this.success,
    this.data,
    this.message,
  });

  factory CountryListResponse.fromJson(Map<String, dynamic> json) =>
      CountryListResponse(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<CountryModel>.from(
                json["data"]!.map((x) => CountryModel.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? []
            : List<CountryModel>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

@immutable
class CountryModel {
  final String? name;
  final String? countryCode;
  final String? image;

  const CountryModel({
    this.name,
    this.countryCode,
    this.image,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json["name"],
        countryCode: json["country_code"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "country_code": countryCode,
        "image": image,
      };
}
