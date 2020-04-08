// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_freezed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Country _$_$_CountryFromJson(Map<String, dynamic> json) {
  return _$_Country(
    totalRecovered: json['totalRecovered'] as num ?? 0,
    totalDeaths: json['totalDeaths'] as num ?? 0,
    totalConfirmed: json['totalConfirmed'] as num ?? 0,
    country: json['country'] as String ?? '',
    countryCode: json['countryCode'] as String ?? '',
    dailyConfirmed: json['dailyConfirmed'] as num ?? 0,
    dailyDeaths: json['dailyDeaths'] as num ?? 0,
    activeCases: json['activeCases'] as num ?? 0,
    totalCritical: json['totalCritical'] as num ?? 0,
    totalConfirmedPerMillionPopulation:
        json['totalConfirmedPerMillionPopulation'] as num ?? 0,
    totalDeathsPerMillionPopulation:
        json['totalDeathsPerMillionPopulation'] as num ?? 0,
    fR: json['fR'] as String ?? '',
    pR: json['pR'] as String ?? '',
    lastUpdated: json['lastUpdated'] as String ?? '',
  );
}

Map<String, dynamic> _$_$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'totalRecovered': instance.totalRecovered,
      'totalDeaths': instance.totalDeaths,
      'totalConfirmed': instance.totalConfirmed,
      'country': instance.country,
      'countryCode': instance.countryCode,
      'dailyConfirmed': instance.dailyConfirmed,
      'dailyDeaths': instance.dailyDeaths,
      'activeCases': instance.activeCases,
      'totalCritical': instance.totalCritical,
      'totalConfirmedPerMillionPopulation':
          instance.totalConfirmedPerMillionPopulation,
      'totalDeathsPerMillionPopulation':
          instance.totalDeathsPerMillionPopulation,
      'fR': instance.fR,
      'pR': instance.pR,
      'lastUpdated': instance.lastUpdated,
    };
