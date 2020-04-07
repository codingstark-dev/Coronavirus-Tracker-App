// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'covid_freezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

class _$CountryTearOff {
  const _$CountryTearOff();

  _Country call(
      {num recover = 0,
      num death = 0,
      num confirmed = 0,
      @nullable String countryName = '',
      @nullable String countryFlag = ''}) {
    return _Country(
      recover: recover,
      death: death,
      confirmed: confirmed,
      countryName: countryName,
      countryFlag: countryFlag,
    );
  }
}

// ignore: unused_element
const $Country = _$CountryTearOff();

mixin _$Country {
  num get recover;
  num get death;
  num get confirmed;
  @nullable
  String get countryName;
  @nullable
  String get countryFlag;

  Map<String, dynamic> toJson();
  $CountryCopyWith<Country> get copyWith;
}

abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res>;
  $Res call(
      {num recover,
      num death,
      num confirmed,
      @nullable String countryName,
      @nullable String countryFlag});
}

class _$CountryCopyWithImpl<$Res> implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  final Country _value;
  // ignore: unused_field
  final $Res Function(Country) _then;

  @override
  $Res call({
    Object recover = freezed,
    Object death = freezed,
    Object confirmed = freezed,
    Object countryName = freezed,
    Object countryFlag = freezed,
  }) {
    return _then(_value.copyWith(
      recover: recover == freezed ? _value.recover : recover as num,
      death: death == freezed ? _value.death : death as num,
      confirmed: confirmed == freezed ? _value.confirmed : confirmed as num,
      countryName:
          countryName == freezed ? _value.countryName : countryName as String,
      countryFlag:
          countryFlag == freezed ? _value.countryFlag : countryFlag as String,
    ));
  }
}

abstract class _$CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$CountryCopyWith(_Country value, $Res Function(_Country) then) =
      __$CountryCopyWithImpl<$Res>;
  @override
  $Res call(
      {num recover,
      num death,
      num confirmed,
      @nullable String countryName,
      @nullable String countryFlag});
}

class __$CountryCopyWithImpl<$Res> extends _$CountryCopyWithImpl<$Res>
    implements _$CountryCopyWith<$Res> {
  __$CountryCopyWithImpl(_Country _value, $Res Function(_Country) _then)
      : super(_value, (v) => _then(v as _Country));

  @override
  _Country get _value => super._value as _Country;

  @override
  $Res call({
    Object recover = freezed,
    Object death = freezed,
    Object confirmed = freezed,
    Object countryName = freezed,
    Object countryFlag = freezed,
  }) {
    return _then(_Country(
      recover: recover == freezed ? _value.recover : recover as num,
      death: death == freezed ? _value.death : death as num,
      confirmed: confirmed == freezed ? _value.confirmed : confirmed as num,
      countryName:
          countryName == freezed ? _value.countryName : countryName as String,
      countryFlag:
          countryFlag == freezed ? _value.countryFlag : countryFlag as String,
    ));
  }
}

@JsonSerializable()
class _$_Country with DiagnosticableTreeMixin implements _Country {
  const _$_Country(
      {this.recover = 0,
      this.death = 0,
      this.confirmed = 0,
      @nullable this.countryName = '',
      @nullable this.countryFlag = ''})
      : assert(recover != null),
        assert(death != null),
        assert(confirmed != null);

  factory _$_Country.fromJson(Map<String, dynamic> json) =>
      _$_$_CountryFromJson(json);

  @JsonKey(defaultValue: 0)
  @override
  final num recover;
  @JsonKey(defaultValue: 0)
  @override
  final num death;
  @JsonKey(defaultValue: 0)
  @override
  final num confirmed;
  @JsonKey(defaultValue: '')
  @override
  @nullable
  final String countryName;
  @JsonKey(defaultValue: '')
  @override
  @nullable
  final String countryFlag;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Country(recover: $recover, death: $death, confirmed: $confirmed, countryName: $countryName, countryFlag: $countryFlag)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Country'))
      ..add(DiagnosticsProperty('recover', recover))
      ..add(DiagnosticsProperty('death', death))
      ..add(DiagnosticsProperty('confirmed', confirmed))
      ..add(DiagnosticsProperty('countryName', countryName))
      ..add(DiagnosticsProperty('countryFlag', countryFlag));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Country &&
            (identical(other.recover, recover) ||
                const DeepCollectionEquality()
                    .equals(other.recover, recover)) &&
            (identical(other.death, death) ||
                const DeepCollectionEquality().equals(other.death, death)) &&
            (identical(other.confirmed, confirmed) ||
                const DeepCollectionEquality()
                    .equals(other.confirmed, confirmed)) &&
            (identical(other.countryName, countryName) ||
                const DeepCollectionEquality()
                    .equals(other.countryName, countryName)) &&
            (identical(other.countryFlag, countryFlag) ||
                const DeepCollectionEquality()
                    .equals(other.countryFlag, countryFlag)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(recover) ^
      const DeepCollectionEquality().hash(death) ^
      const DeepCollectionEquality().hash(confirmed) ^
      const DeepCollectionEquality().hash(countryName) ^
      const DeepCollectionEquality().hash(countryFlag);

  @override
  _$CountryCopyWith<_Country> get copyWith =>
      __$CountryCopyWithImpl<_Country>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CountryToJson(this);
  }
}

abstract class _Country implements Country {
  const factory _Country(
      {num recover,
      num death,
      num confirmed,
      @nullable String countryName,
      @nullable String countryFlag}) = _$_Country;

  factory _Country.fromJson(Map<String, dynamic> json) = _$_Country.fromJson;

  @override
  num get recover;
  @override
  num get death;
  @override
  num get confirmed;
  @override
  @nullable
  String get countryName;
  @override
  @nullable
  String get countryFlag;
  @override
  _$CountryCopyWith<_Country> get copyWith;
}

AllCountry _$AllCountryFromJson(Map<String, dynamic> json) {
  return _AllCountry.fromJson(json);
}

class _$AllCountryTearOff {
  const _$AllCountryTearOff();

  _AllCountry call(
      {List<dynamic> recover,
      List<dynamic> death,
      List<dynamic> confirmed,
      List<dynamic> countryCode,
      List<dynamic> country}) {
    return _AllCountry(
      recover: recover,
      death: death,
      confirmed: confirmed,
      countryCode: countryCode,
      country: country,
    );
  }
}

// ignore: unused_element
const $AllCountry = _$AllCountryTearOff();

mixin _$AllCountry {
  List<dynamic> get recover;
  List<dynamic> get death;
  List<dynamic> get confirmed;
  List<dynamic> get countryCode;
  List<dynamic> get country;

  Map<String, dynamic> toJson();
  $AllCountryCopyWith<AllCountry> get copyWith;
}

abstract class $AllCountryCopyWith<$Res> {
  factory $AllCountryCopyWith(
          AllCountry value, $Res Function(AllCountry) then) =
      _$AllCountryCopyWithImpl<$Res>;
  $Res call(
      {List<dynamic> recover,
      List<dynamic> death,
      List<dynamic> confirmed,
      List<dynamic> countryCode,
      List<dynamic> country});
}

class _$AllCountryCopyWithImpl<$Res> implements $AllCountryCopyWith<$Res> {
  _$AllCountryCopyWithImpl(this._value, this._then);

  final AllCountry _value;
  // ignore: unused_field
  final $Res Function(AllCountry) _then;

  @override
  $Res call({
    Object recover = freezed,
    Object death = freezed,
    Object confirmed = freezed,
    Object countryCode = freezed,
    Object country = freezed,
  }) {
    return _then(_value.copyWith(
      recover: recover == freezed ? _value.recover : recover as List<dynamic>,
      death: death == freezed ? _value.death : death as List<dynamic>,
      confirmed:
          confirmed == freezed ? _value.confirmed : confirmed as List<dynamic>,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode as List<dynamic>,
      country: country == freezed ? _value.country : country as List<dynamic>,
    ));
  }
}

abstract class _$AllCountryCopyWith<$Res> implements $AllCountryCopyWith<$Res> {
  factory _$AllCountryCopyWith(
          _AllCountry value, $Res Function(_AllCountry) then) =
      __$AllCountryCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<dynamic> recover,
      List<dynamic> death,
      List<dynamic> confirmed,
      List<dynamic> countryCode,
      List<dynamic> country});
}

class __$AllCountryCopyWithImpl<$Res> extends _$AllCountryCopyWithImpl<$Res>
    implements _$AllCountryCopyWith<$Res> {
  __$AllCountryCopyWithImpl(
      _AllCountry _value, $Res Function(_AllCountry) _then)
      : super(_value, (v) => _then(v as _AllCountry));

  @override
  _AllCountry get _value => super._value as _AllCountry;

  @override
  $Res call({
    Object recover = freezed,
    Object death = freezed,
    Object confirmed = freezed,
    Object countryCode = freezed,
    Object country = freezed,
  }) {
    return _then(_AllCountry(
      recover: recover == freezed ? _value.recover : recover as List<dynamic>,
      death: death == freezed ? _value.death : death as List<dynamic>,
      confirmed:
          confirmed == freezed ? _value.confirmed : confirmed as List<dynamic>,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode as List<dynamic>,
      country: country == freezed ? _value.country : country as List<dynamic>,
    ));
  }
}

@JsonSerializable()
class _$_AllCountry with DiagnosticableTreeMixin implements _AllCountry {
  const _$_AllCountry(
      {this.recover,
      this.death,
      this.confirmed,
      this.countryCode,
      this.country});

  factory _$_AllCountry.fromJson(Map<String, dynamic> json) =>
      _$_$_AllCountryFromJson(json);

  @override
  final List<dynamic> recover;
  @override
  final List<dynamic> death;
  @override
  final List<dynamic> confirmed;
  @override
  final List<dynamic> countryCode;
  @override
  final List<dynamic> country;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AllCountry(recover: $recover, death: $death, confirmed: $confirmed, countryCode: $countryCode, country: $country)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AllCountry'))
      ..add(DiagnosticsProperty('recover', recover))
      ..add(DiagnosticsProperty('death', death))
      ..add(DiagnosticsProperty('confirmed', confirmed))
      ..add(DiagnosticsProperty('countryCode', countryCode))
      ..add(DiagnosticsProperty('country', country));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AllCountry &&
            (identical(other.recover, recover) ||
                const DeepCollectionEquality()
                    .equals(other.recover, recover)) &&
            (identical(other.death, death) ||
                const DeepCollectionEquality().equals(other.death, death)) &&
            (identical(other.confirmed, confirmed) ||
                const DeepCollectionEquality()
                    .equals(other.confirmed, confirmed)) &&
            (identical(other.countryCode, countryCode) ||
                const DeepCollectionEquality()
                    .equals(other.countryCode, countryCode)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality().equals(other.country, country)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(recover) ^
      const DeepCollectionEquality().hash(death) ^
      const DeepCollectionEquality().hash(confirmed) ^
      const DeepCollectionEquality().hash(countryCode) ^
      const DeepCollectionEquality().hash(country);

  @override
  _$AllCountryCopyWith<_AllCountry> get copyWith =>
      __$AllCountryCopyWithImpl<_AllCountry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AllCountryToJson(this);
  }
}

abstract class _AllCountry implements AllCountry {
  const factory _AllCountry(
      {List<dynamic> recover,
      List<dynamic> death,
      List<dynamic> confirmed,
      List<dynamic> countryCode,
      List<dynamic> country}) = _$_AllCountry;

  factory _AllCountry.fromJson(Map<String, dynamic> json) =
      _$_AllCountry.fromJson;

  @override
  List<dynamic> get recover;
  @override
  List<dynamic> get death;
  @override
  List<dynamic> get confirmed;
  @override
  List<dynamic> get countryCode;
  @override
  List<dynamic> get country;
  @override
  _$AllCountryCopyWith<_AllCountry> get copyWith;
}

class _$NewsDataTearOff {
  const _$NewsDataTearOff();

  _NewsData call(List<dynamic> newsdata) {
    return _NewsData(
      newsdata,
    );
  }
}

// ignore: unused_element
const $NewsData = _$NewsDataTearOff();

mixin _$NewsData {
  List<dynamic> get newsdata;

  $NewsDataCopyWith<NewsData> get copyWith;
}

abstract class $NewsDataCopyWith<$Res> {
  factory $NewsDataCopyWith(NewsData value, $Res Function(NewsData) then) =
      _$NewsDataCopyWithImpl<$Res>;
  $Res call({List<dynamic> newsdata});
}

class _$NewsDataCopyWithImpl<$Res> implements $NewsDataCopyWith<$Res> {
  _$NewsDataCopyWithImpl(this._value, this._then);

  final NewsData _value;
  // ignore: unused_field
  final $Res Function(NewsData) _then;

  @override
  $Res call({
    Object newsdata = freezed,
  }) {
    return _then(_value.copyWith(
      newsdata:
          newsdata == freezed ? _value.newsdata : newsdata as List<dynamic>,
    ));
  }
}

abstract class _$NewsDataCopyWith<$Res> implements $NewsDataCopyWith<$Res> {
  factory _$NewsDataCopyWith(_NewsData value, $Res Function(_NewsData) then) =
      __$NewsDataCopyWithImpl<$Res>;
  @override
  $Res call({List<dynamic> newsdata});
}

class __$NewsDataCopyWithImpl<$Res> extends _$NewsDataCopyWithImpl<$Res>
    implements _$NewsDataCopyWith<$Res> {
  __$NewsDataCopyWithImpl(_NewsData _value, $Res Function(_NewsData) _then)
      : super(_value, (v) => _then(v as _NewsData));

  @override
  _NewsData get _value => super._value as _NewsData;

  @override
  $Res call({
    Object newsdata = freezed,
  }) {
    return _then(_NewsData(
      newsdata == freezed ? _value.newsdata : newsdata as List<dynamic>,
    ));
  }
}

class _$_NewsData with DiagnosticableTreeMixin implements _NewsData {
  _$_NewsData(this.newsdata) : assert(newsdata != null);

  @override
  final List<dynamic> newsdata;

  bool _diddescription = false;
  List<dynamic> _description;

  @override
  List<dynamic> get description {
    if (_diddescription == false) {
      _diddescription = true;
      _description = newsdata.map((e) => e['description']).toList();
    }
    return _description;
  }

  bool _didtitle = false;
  List<dynamic> _title;

  @override
  List<dynamic> get title {
    if (_didtitle == false) {
      _didtitle = true;
      _title = newsdata.map((e) => e['title']).toList();
    }
    return _title;
  }

  bool _didurlToImage = false;
  List<dynamic> _urlToImage;

  @override
  List<dynamic> get urlToImage {
    if (_didurlToImage == false) {
      _didurlToImage = true;
      _urlToImage = newsdata.map((e) => e['urlToImage']).toList();
    }
    return _urlToImage;
  }

  bool _didpublishedAt = false;
  List<dynamic> _publishedAt;

  @override
  List<dynamic> get publishedAt {
    if (_didpublishedAt == false) {
      _didpublishedAt = true;
      _publishedAt = newsdata.map((e) => e['publishedAt']).toList();
    }
    return _publishedAt;
  }

  bool _didcountryCode = false;
  List<dynamic> _countryCode;

  @override
  List<dynamic> get countryCode {
    if (_didcountryCode == false) {
      _didcountryCode = true;
      _countryCode = newsdata.map((e) => e['countryCode']).toList();
    }
    return _countryCode;
  }

  bool _didurl = false;
  List<dynamic> _url;

  @override
  List<dynamic> get url {
    if (_didurl == false) {
      _didurl = true;
      _url = newsdata.map((e) => e['url']).toList();
    }
    return _url;
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NewsData(newsdata: $newsdata, description: $description, title: $title, urlToImage: $urlToImage, publishedAt: $publishedAt, countryCode: $countryCode, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NewsData'))
      ..add(DiagnosticsProperty('newsdata', newsdata))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('urlToImage', urlToImage))
      ..add(DiagnosticsProperty('publishedAt', publishedAt))
      ..add(DiagnosticsProperty('countryCode', countryCode))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewsData &&
            (identical(other.newsdata, newsdata) ||
                const DeepCollectionEquality()
                    .equals(other.newsdata, newsdata)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newsdata);

  @override
  _$NewsDataCopyWith<_NewsData> get copyWith =>
      __$NewsDataCopyWithImpl<_NewsData>(this, _$identity);
}

abstract class _NewsData implements NewsData {
  factory _NewsData(List<dynamic> newsdata) = _$_NewsData;

  @override
  List<dynamic> get newsdata;
  @override
  _$NewsDataCopyWith<_NewsData> get copyWith;
}
