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
      @Default(0) num confirmed,
      @Default('') @nullable String countryName,
      @Default('') @nullable String countryFlag}) = _Country;

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

@freezed
abstract class NewsData with _$NewsData {
  factory NewsData(
    List<dynamic> newsdata,
  ) = _NewsData;

  @late
  List<dynamic> get description =>
      newsdata.map((e) => e['description']).toList();
  @late
  List<dynamic> get title =>
      newsdata.map((e) => e['title']).toList();
  @late
  List<dynamic> get urlToImage =>
      newsdata.map((e) => e['urlToImage']).toList();
  @late
  List<dynamic> get publishedAt =>
      newsdata.map((e) => e['publishedAt']).toList();
  @late
  List<dynamic> get countryCode =>
      newsdata.map((e) => e['countryCode']).toList();
  @late
  List<dynamic> get url =>
      newsdata.map((e) => e['url']).toList();
}
