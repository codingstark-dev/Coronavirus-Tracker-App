// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_freezed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Country _$_$_CountryFromJson(Map<String, dynamic> json) {
  return _$_Country(
    recover: json['recover'] as num ?? 0,
    death: json['death'] as num ?? 0,
    confirmed: json['confirmed'] as num ?? 0,
  );
}

Map<String, dynamic> _$_$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'recover': instance.recover,
      'death': instance.death,
      'confirmed': instance.confirmed,
    };

_$_AllCountry _$_$_AllCountryFromJson(Map<String, dynamic> json) {
  return _$_AllCountry(
    recover: json['recover'] as List,
    death: json['death'] as List,
    confirmed: json['confirmed'] as List,
    countryCode: json['countryCode'] as List,
    country: json['country'] as List,
  );
}

Map<String, dynamic> _$_$_AllCountryToJson(_$_AllCountry instance) =>
    <String, dynamic>{
      'recover': instance.recover,
      'death': instance.death,
      'confirmed': instance.confirmed,
      'countryCode': instance.countryCode,
      'country': instance.country,
    };
