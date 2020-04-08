import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'covid_freezed.freezed.dart';
part 'covid_freezed.g.dart';

@freezed
abstract class Country with _$Country {
  const factory Country(
      {@Default(0) num totalRecovered,
      @Default(0) num totalDeaths,
      @Default(0) num totalConfirmed,
      @Default('') @nullable String country,
      @Default('') @nullable String countryCode,
      @Default(0) @nullable num dailyConfirmed,
      @Default(0) @nullable num dailyDeaths,
      @Default(0) @nullable num activeCases,
      @Default(0) @nullable num totalCritical,
      @Default(0) @nullable num totalConfirmedPerMillionPopulation,
      @Default(0) @nullable num totalDeathsPerMillionPopulation,
      @Default('') @nullable String fR,
      @Default('') @nullable String pR,
      @Default('') @nullable String lastUpdated}) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
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
  List<dynamic> get title => newsdata.map((e) => e['title']).toList();
  @late
  List<dynamic> get urlToImage => newsdata.map((e) => e['urlToImage']).toList();
  @late
  List<dynamic> get publishedAt =>
      newsdata.map((e) => e['publishedAt']).toList();
  @late
  List<dynamic> get countryCode =>
      newsdata.map((e) => e['countryCode']).toList();
  @late
  List<dynamic> get url => newsdata.map((e) => e['url']).toList();
}

@freezed
abstract class CountryReport with _$CountryReport {
  factory CountryReport(
    dynamic countryreport,
  ) = _CountryReport;

  @late
  List<dynamic> get countryCode =>
      countryreport.map((e) => e['countryCode']).toList();
  @late
  List<dynamic> get country => countryreport.map((e) => e['country']).toList();
  @late
  List<dynamic> get totalConfirmed =>
      countryreport.map((e) => e['totalConfirmed']).toList();
  @late
  List<dynamic> get totalDeaths =>
      countryreport.map((e) => e['totalDeaths']).toList();
  @late
  List<dynamic> get totalRecovered =>
      countryreport.map((e) => e['totalRecovered']).toList();
  @late
  List<dynamic> get dailyConfirmed =>
      countryreport.map((e) => e['dailyConfirmed']).toList();
  @late
  List<dynamic> get dailyDeaths =>
      countryreport.map((e) => e['dailyDeaths']).toList();
  @late
  List<dynamic> get activeCases =>
      countryreport.map((e) => e['activeCases']).toList();
  @late
  List<dynamic> get totalCritical =>
      countryreport.map((e) => e['totalCritical']).toList();
  @late
  List<dynamic> get totalConfirmedPerMillionPopulation => countryreport
      .map((e) => e['totalConfirmedPerMillionPopulation'])
      .toList();
  @late
  List<dynamic> get totalDeathsPerMillionPopulation =>
      countryreport.map((e) => e['totalDeathsPerMillionPopulation']).toList();
  @late
  List<dynamic> get fR => countryreport.map((e) => e['FR']).toList();
  @late
  List<dynamic> get pR => countryreport.map((e) => e['PR']).toList();
  @late
  List<dynamic> get lastUpdated =>
      countryreport.map((e) => e['lastUpdated']).toList();
}
