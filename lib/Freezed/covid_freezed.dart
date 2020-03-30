import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'covid_freezed.freezed.dart';
part 'covid_freezed.g.dart';

@freezed
abstract class Country with _$Country {
  const factory Country(
      {@Default(0) num recover,
      @Default(0) num death,
      @Default(0) num confirmed}) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@freezed
abstract class AllCountry with _$AllCountry {
  const factory AllCountry(
      {List<dynamic> recover,
      List<dynamic> death,
      List<dynamic> confirmed,
      List<dynamic> countryCode,
      List<dynamic> country}) = _AllCountry;

  factory AllCountry.fromJson(Map<String, dynamic> json) =>
      _$AllCountryFromJson(json);
}
