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
      {num totalRecovered = 0,
      num totalDeaths = 0,
      num totalConfirmed = 0,
      @nullable String country = '',
      @nullable String countryCode = '',
      @nullable num dailyConfirmed = 0,
      @nullable num dailyDeaths = 0,
      @nullable num activeCases = 0,
      @nullable num totalCritical = 0,
      @nullable num totalConfirmedPerMillionPopulation = 0,
      @nullable num totalDeathsPerMillionPopulation = 0,
      @nullable String fR = '',
      @nullable String pR = '',
      @nullable String lastUpdated = ''}) {
    return _Country(
      totalRecovered: totalRecovered,
      totalDeaths: totalDeaths,
      totalConfirmed: totalConfirmed,
      country: country,
      countryCode: countryCode,
      dailyConfirmed: dailyConfirmed,
      dailyDeaths: dailyDeaths,
      activeCases: activeCases,
      totalCritical: totalCritical,
      totalConfirmedPerMillionPopulation: totalConfirmedPerMillionPopulation,
      totalDeathsPerMillionPopulation: totalDeathsPerMillionPopulation,
      fR: fR,
      pR: pR,
      lastUpdated: lastUpdated,
    );
  }
}

// ignore: unused_element
const $Country = _$CountryTearOff();

mixin _$Country {
  num get totalRecovered;
  num get totalDeaths;
  num get totalConfirmed;
  @nullable
  String get country;
  @nullable
  String get countryCode;
  @nullable
  num get dailyConfirmed;
  @nullable
  num get dailyDeaths;
  @nullable
  num get activeCases;
  @nullable
  num get totalCritical;
  @nullable
  num get totalConfirmedPerMillionPopulation;
  @nullable
  num get totalDeathsPerMillionPopulation;
  @nullable
  String get fR;
  @nullable
  String get pR;
  @nullable
  String get lastUpdated;

  Map<String, dynamic> toJson();
  $CountryCopyWith<Country> get copyWith;
}

abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res>;
  $Res call(
      {num totalRecovered,
      num totalDeaths,
      num totalConfirmed,
      @nullable String country,
      @nullable String countryCode,
      @nullable num dailyConfirmed,
      @nullable num dailyDeaths,
      @nullable num activeCases,
      @nullable num totalCritical,
      @nullable num totalConfirmedPerMillionPopulation,
      @nullable num totalDeathsPerMillionPopulation,
      @nullable String fR,
      @nullable String pR,
      @nullable String lastUpdated});
}

class _$CountryCopyWithImpl<$Res> implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  final Country _value;
  // ignore: unused_field
  final $Res Function(Country) _then;

  @override
  $Res call({
    Object totalRecovered = freezed,
    Object totalDeaths = freezed,
    Object totalConfirmed = freezed,
    Object country = freezed,
    Object countryCode = freezed,
    Object dailyConfirmed = freezed,
    Object dailyDeaths = freezed,
    Object activeCases = freezed,
    Object totalCritical = freezed,
    Object totalConfirmedPerMillionPopulation = freezed,
    Object totalDeathsPerMillionPopulation = freezed,
    Object fR = freezed,
    Object pR = freezed,
    Object lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      totalRecovered: totalRecovered == freezed
          ? _value.totalRecovered
          : totalRecovered as num,
      totalDeaths:
          totalDeaths == freezed ? _value.totalDeaths : totalDeaths as num,
      totalConfirmed: totalConfirmed == freezed
          ? _value.totalConfirmed
          : totalConfirmed as num,
      country: country == freezed ? _value.country : country as String,
      countryCode:
          countryCode == freezed ? _value.countryCode : countryCode as String,
      dailyConfirmed: dailyConfirmed == freezed
          ? _value.dailyConfirmed
          : dailyConfirmed as num,
      dailyDeaths:
          dailyDeaths == freezed ? _value.dailyDeaths : dailyDeaths as num,
      activeCases:
          activeCases == freezed ? _value.activeCases : activeCases as num,
      totalCritical: totalCritical == freezed
          ? _value.totalCritical
          : totalCritical as num,
      totalConfirmedPerMillionPopulation:
          totalConfirmedPerMillionPopulation == freezed
              ? _value.totalConfirmedPerMillionPopulation
              : totalConfirmedPerMillionPopulation as num,
      totalDeathsPerMillionPopulation:
          totalDeathsPerMillionPopulation == freezed
              ? _value.totalDeathsPerMillionPopulation
              : totalDeathsPerMillionPopulation as num,
      fR: fR == freezed ? _value.fR : fR as String,
      pR: pR == freezed ? _value.pR : pR as String,
      lastUpdated:
          lastUpdated == freezed ? _value.lastUpdated : lastUpdated as String,
    ));
  }
}

abstract class _$CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$CountryCopyWith(_Country value, $Res Function(_Country) then) =
      __$CountryCopyWithImpl<$Res>;
  @override
  $Res call(
      {num totalRecovered,
      num totalDeaths,
      num totalConfirmed,
      @nullable String country,
      @nullable String countryCode,
      @nullable num dailyConfirmed,
      @nullable num dailyDeaths,
      @nullable num activeCases,
      @nullable num totalCritical,
      @nullable num totalConfirmedPerMillionPopulation,
      @nullable num totalDeathsPerMillionPopulation,
      @nullable String fR,
      @nullable String pR,
      @nullable String lastUpdated});
}

class __$CountryCopyWithImpl<$Res> extends _$CountryCopyWithImpl<$Res>
    implements _$CountryCopyWith<$Res> {
  __$CountryCopyWithImpl(_Country _value, $Res Function(_Country) _then)
      : super(_value, (v) => _then(v as _Country));

  @override
  _Country get _value => super._value as _Country;

  @override
  $Res call({
    Object totalRecovered = freezed,
    Object totalDeaths = freezed,
    Object totalConfirmed = freezed,
    Object country = freezed,
    Object countryCode = freezed,
    Object dailyConfirmed = freezed,
    Object dailyDeaths = freezed,
    Object activeCases = freezed,
    Object totalCritical = freezed,
    Object totalConfirmedPerMillionPopulation = freezed,
    Object totalDeathsPerMillionPopulation = freezed,
    Object fR = freezed,
    Object pR = freezed,
    Object lastUpdated = freezed,
  }) {
    return _then(_Country(
      totalRecovered: totalRecovered == freezed
          ? _value.totalRecovered
          : totalRecovered as num,
      totalDeaths:
          totalDeaths == freezed ? _value.totalDeaths : totalDeaths as num,
      totalConfirmed: totalConfirmed == freezed
          ? _value.totalConfirmed
          : totalConfirmed as num,
      country: country == freezed ? _value.country : country as String,
      countryCode:
          countryCode == freezed ? _value.countryCode : countryCode as String,
      dailyConfirmed: dailyConfirmed == freezed
          ? _value.dailyConfirmed
          : dailyConfirmed as num,
      dailyDeaths:
          dailyDeaths == freezed ? _value.dailyDeaths : dailyDeaths as num,
      activeCases:
          activeCases == freezed ? _value.activeCases : activeCases as num,
      totalCritical: totalCritical == freezed
          ? _value.totalCritical
          : totalCritical as num,
      totalConfirmedPerMillionPopulation:
          totalConfirmedPerMillionPopulation == freezed
              ? _value.totalConfirmedPerMillionPopulation
              : totalConfirmedPerMillionPopulation as num,
      totalDeathsPerMillionPopulation:
          totalDeathsPerMillionPopulation == freezed
              ? _value.totalDeathsPerMillionPopulation
              : totalDeathsPerMillionPopulation as num,
      fR: fR == freezed ? _value.fR : fR as String,
      pR: pR == freezed ? _value.pR : pR as String,
      lastUpdated:
          lastUpdated == freezed ? _value.lastUpdated : lastUpdated as String,
    ));
  }
}

@JsonSerializable()
class _$_Country with DiagnosticableTreeMixin implements _Country {
  const _$_Country(
      {this.totalRecovered = 0,
      this.totalDeaths = 0,
      this.totalConfirmed = 0,
      @nullable this.country = '',
      @nullable this.countryCode = '',
      @nullable this.dailyConfirmed = 0,
      @nullable this.dailyDeaths = 0,
      @nullable this.activeCases = 0,
      @nullable this.totalCritical = 0,
      @nullable this.totalConfirmedPerMillionPopulation = 0,
      @nullable this.totalDeathsPerMillionPopulation = 0,
      @nullable this.fR = '',
      @nullable this.pR = '',
      @nullable this.lastUpdated = ''})
      : assert(totalRecovered != null),
        assert(totalDeaths != null),
        assert(totalConfirmed != null);

  factory _$_Country.fromJson(Map<String, dynamic> json) =>
      _$_$_CountryFromJson(json);

  @JsonKey(defaultValue: 0)
  @override
  final num totalRecovered;
  @JsonKey(defaultValue: 0)
  @override
  final num totalDeaths;
  @JsonKey(defaultValue: 0)
  @override
  final num totalConfirmed;
  @JsonKey(defaultValue: '')
  @override
  @nullable
  final String country;
  @JsonKey(defaultValue: '')
  @override
  @nullable
  final String countryCode;
  @JsonKey(defaultValue: 0)
  @override
  @nullable
  final num dailyConfirmed;
  @JsonKey(defaultValue: 0)
  @override
  @nullable
  final num dailyDeaths;
  @JsonKey(defaultValue: 0)
  @override
  @nullable
  final num activeCases;
  @JsonKey(defaultValue: 0)
  @override
  @nullable
  final num totalCritical;
  @JsonKey(defaultValue: 0)
  @override
  @nullable
  final num totalConfirmedPerMillionPopulation;
  @JsonKey(defaultValue: 0)
  @override
  @nullable
  final num totalDeathsPerMillionPopulation;
  @JsonKey(defaultValue: '')
  @override
  @nullable
  final String fR;
  @JsonKey(defaultValue: '')
  @override
  @nullable
  final String pR;
  @JsonKey(defaultValue: '')
  @override
  @nullable
  final String lastUpdated;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Country(totalRecovered: $totalRecovered, totalDeaths: $totalDeaths, totalConfirmed: $totalConfirmed, country: $country, countryCode: $countryCode, dailyConfirmed: $dailyConfirmed, dailyDeaths: $dailyDeaths, activeCases: $activeCases, totalCritical: $totalCritical, totalConfirmedPerMillionPopulation: $totalConfirmedPerMillionPopulation, totalDeathsPerMillionPopulation: $totalDeathsPerMillionPopulation, fR: $fR, pR: $pR, lastUpdated: $lastUpdated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Country'))
      ..add(DiagnosticsProperty('totalRecovered', totalRecovered))
      ..add(DiagnosticsProperty('totalDeaths', totalDeaths))
      ..add(DiagnosticsProperty('totalConfirmed', totalConfirmed))
      ..add(DiagnosticsProperty('country', country))
      ..add(DiagnosticsProperty('countryCode', countryCode))
      ..add(DiagnosticsProperty('dailyConfirmed', dailyConfirmed))
      ..add(DiagnosticsProperty('dailyDeaths', dailyDeaths))
      ..add(DiagnosticsProperty('activeCases', activeCases))
      ..add(DiagnosticsProperty('totalCritical', totalCritical))
      ..add(DiagnosticsProperty('totalConfirmedPerMillionPopulation',
          totalConfirmedPerMillionPopulation))
      ..add(DiagnosticsProperty(
          'totalDeathsPerMillionPopulation', totalDeathsPerMillionPopulation))
      ..add(DiagnosticsProperty('fR', fR))
      ..add(DiagnosticsProperty('pR', pR))
      ..add(DiagnosticsProperty('lastUpdated', lastUpdated));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Country &&
            (identical(other.totalRecovered, totalRecovered) ||
                const DeepCollectionEquality()
                    .equals(other.totalRecovered, totalRecovered)) &&
            (identical(other.totalDeaths, totalDeaths) ||
                const DeepCollectionEquality()
                    .equals(other.totalDeaths, totalDeaths)) &&
            (identical(other.totalConfirmed, totalConfirmed) ||
                const DeepCollectionEquality()
                    .equals(other.totalConfirmed, totalConfirmed)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.countryCode, countryCode) ||
                const DeepCollectionEquality()
                    .equals(other.countryCode, countryCode)) &&
            (identical(other.dailyConfirmed, dailyConfirmed) ||
                const DeepCollectionEquality()
                    .equals(other.dailyConfirmed, dailyConfirmed)) &&
            (identical(other.dailyDeaths, dailyDeaths) ||
                const DeepCollectionEquality()
                    .equals(other.dailyDeaths, dailyDeaths)) &&
            (identical(other.activeCases, activeCases) ||
                const DeepCollectionEquality()
                    .equals(other.activeCases, activeCases)) &&
            (identical(other.totalCritical, totalCritical) ||
                const DeepCollectionEquality()
                    .equals(other.totalCritical, totalCritical)) &&
            (identical(other.totalConfirmedPerMillionPopulation,
                    totalConfirmedPerMillionPopulation) ||
                const DeepCollectionEquality().equals(
                    other.totalConfirmedPerMillionPopulation,
                    totalConfirmedPerMillionPopulation)) &&
            (identical(other.totalDeathsPerMillionPopulation,
                    totalDeathsPerMillionPopulation) ||
                const DeepCollectionEquality().equals(
                    other.totalDeathsPerMillionPopulation,
                    totalDeathsPerMillionPopulation)) &&
            (identical(other.fR, fR) ||
                const DeepCollectionEquality().equals(other.fR, fR)) &&
            (identical(other.pR, pR) ||
                const DeepCollectionEquality().equals(other.pR, pR)) &&
            (identical(other.lastUpdated, lastUpdated) ||
                const DeepCollectionEquality()
                    .equals(other.lastUpdated, lastUpdated)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(totalRecovered) ^
      const DeepCollectionEquality().hash(totalDeaths) ^
      const DeepCollectionEquality().hash(totalConfirmed) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(countryCode) ^
      const DeepCollectionEquality().hash(dailyConfirmed) ^
      const DeepCollectionEquality().hash(dailyDeaths) ^
      const DeepCollectionEquality().hash(activeCases) ^
      const DeepCollectionEquality().hash(totalCritical) ^
      const DeepCollectionEquality().hash(totalConfirmedPerMillionPopulation) ^
      const DeepCollectionEquality().hash(totalDeathsPerMillionPopulation) ^
      const DeepCollectionEquality().hash(fR) ^
      const DeepCollectionEquality().hash(pR) ^
      const DeepCollectionEquality().hash(lastUpdated);

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
      {num totalRecovered,
      num totalDeaths,
      num totalConfirmed,
      @nullable String country,
      @nullable String countryCode,
      @nullable num dailyConfirmed,
      @nullable num dailyDeaths,
      @nullable num activeCases,
      @nullable num totalCritical,
      @nullable num totalConfirmedPerMillionPopulation,
      @nullable num totalDeathsPerMillionPopulation,
      @nullable String fR,
      @nullable String pR,
      @nullable String lastUpdated}) = _$_Country;

  factory _Country.fromJson(Map<String, dynamic> json) = _$_Country.fromJson;

  @override
  num get totalRecovered;
  @override
  num get totalDeaths;
  @override
  num get totalConfirmed;
  @override
  @nullable
  String get country;
  @override
  @nullable
  String get countryCode;
  @override
  @nullable
  num get dailyConfirmed;
  @override
  @nullable
  num get dailyDeaths;
  @override
  @nullable
  num get activeCases;
  @override
  @nullable
  num get totalCritical;
  @override
  @nullable
  num get totalConfirmedPerMillionPopulation;
  @override
  @nullable
  num get totalDeathsPerMillionPopulation;
  @override
  @nullable
  String get fR;
  @override
  @nullable
  String get pR;
  @override
  @nullable
  String get lastUpdated;
  @override
  _$CountryCopyWith<_Country> get copyWith;
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

class _$CountryReportTearOff {
  const _$CountryReportTearOff();

  _CountryReport call(dynamic countryreport) {
    return _CountryReport(
      countryreport,
    );
  }
}

// ignore: unused_element
const $CountryReport = _$CountryReportTearOff();

mixin _$CountryReport {
  dynamic get countryreport;

  $CountryReportCopyWith<CountryReport> get copyWith;
}

abstract class $CountryReportCopyWith<$Res> {
  factory $CountryReportCopyWith(
          CountryReport value, $Res Function(CountryReport) then) =
      _$CountryReportCopyWithImpl<$Res>;
  $Res call({dynamic countryreport});
}

class _$CountryReportCopyWithImpl<$Res>
    implements $CountryReportCopyWith<$Res> {
  _$CountryReportCopyWithImpl(this._value, this._then);

  final CountryReport _value;
  // ignore: unused_field
  final $Res Function(CountryReport) _then;

  @override
  $Res call({
    Object countryreport = freezed,
  }) {
    return _then(_value.copyWith(
      countryreport: countryreport == freezed
          ? _value.countryreport
          : countryreport as dynamic,
    ));
  }
}

abstract class _$CountryReportCopyWith<$Res>
    implements $CountryReportCopyWith<$Res> {
  factory _$CountryReportCopyWith(
          _CountryReport value, $Res Function(_CountryReport) then) =
      __$CountryReportCopyWithImpl<$Res>;
  @override
  $Res call({dynamic countryreport});
}

class __$CountryReportCopyWithImpl<$Res>
    extends _$CountryReportCopyWithImpl<$Res>
    implements _$CountryReportCopyWith<$Res> {
  __$CountryReportCopyWithImpl(
      _CountryReport _value, $Res Function(_CountryReport) _then)
      : super(_value, (v) => _then(v as _CountryReport));

  @override
  _CountryReport get _value => super._value as _CountryReport;

  @override
  $Res call({
    Object countryreport = freezed,
  }) {
    return _then(_CountryReport(
      countryreport == freezed
          ? _value.countryreport
          : countryreport as dynamic,
    ));
  }
}

class _$_CountryReport with DiagnosticableTreeMixin implements _CountryReport {
  _$_CountryReport(this.countryreport) : assert(countryreport != null);

  @override
  final dynamic countryreport;

  bool _didcountryCode = false;
  List<dynamic> _countryCode;

  @override
  List<dynamic> get countryCode {
    if (_didcountryCode == false) {
      _didcountryCode = true;
      _countryCode = countryreport.map((e) => e['countryCode']).toList();
    }
    return _countryCode;
  }

  bool _didcountry = false;
  List<dynamic> _country;

  @override
  List<dynamic> get country {
    if (_didcountry == false) {
      _didcountry = true;
      _country = countryreport.map((e) => e['country']).toList();
    }
    return _country;
  }

  bool _didtotalConfirmed = false;
  List<dynamic> _totalConfirmed;

  @override
  List<dynamic> get totalConfirmed {
    if (_didtotalConfirmed == false) {
      _didtotalConfirmed = true;
      _totalConfirmed = countryreport.map((e) => e['totalConfirmed']).toList();
    }
    return _totalConfirmed;
  }

  bool _didtotalDeaths = false;
  List<dynamic> _totalDeaths;

  @override
  List<dynamic> get totalDeaths {
    if (_didtotalDeaths == false) {
      _didtotalDeaths = true;
      _totalDeaths = countryreport.map((e) => e['totalDeaths']).toList();
    }
    return _totalDeaths;
  }

  bool _didtotalRecovered = false;
  List<dynamic> _totalRecovered;

  @override
  List<dynamic> get totalRecovered {
    if (_didtotalRecovered == false) {
      _didtotalRecovered = true;
      _totalRecovered = countryreport.map((e) => e['totalRecovered']).toList();
    }
    return _totalRecovered;
  }

  bool _diddailyConfirmed = false;
  List<dynamic> _dailyConfirmed;

  @override
  List<dynamic> get dailyConfirmed {
    if (_diddailyConfirmed == false) {
      _diddailyConfirmed = true;
      _dailyConfirmed = countryreport.map((e) => e['dailyConfirmed']).toList();
    }
    return _dailyConfirmed;
  }

  bool _diddailyDeaths = false;
  List<dynamic> _dailyDeaths;

  @override
  List<dynamic> get dailyDeaths {
    if (_diddailyDeaths == false) {
      _diddailyDeaths = true;
      _dailyDeaths = countryreport.map((e) => e['dailyDeaths']).toList();
    }
    return _dailyDeaths;
  }

  bool _didactiveCases = false;
  List<dynamic> _activeCases;

  @override
  List<dynamic> get activeCases {
    if (_didactiveCases == false) {
      _didactiveCases = true;
      _activeCases = countryreport.map((e) => e['activeCases']).toList();
    }
    return _activeCases;
  }

  bool _didtotalCritical = false;
  List<dynamic> _totalCritical;

  @override
  List<dynamic> get totalCritical {
    if (_didtotalCritical == false) {
      _didtotalCritical = true;
      _totalCritical = countryreport.map((e) => e['totalCritical']).toList();
    }
    return _totalCritical;
  }

  bool _didtotalConfirmedPerMillionPopulation = false;
  List<dynamic> _totalConfirmedPerMillionPopulation;

  @override
  List<dynamic> get totalConfirmedPerMillionPopulation {
    if (_didtotalConfirmedPerMillionPopulation == false) {
      _didtotalConfirmedPerMillionPopulation = true;
      _totalConfirmedPerMillionPopulation = countryreport
          .map((e) => e['totalConfirmedPerMillionPopulation'])
          .toList();
    }
    return _totalConfirmedPerMillionPopulation;
  }

  bool _didtotalDeathsPerMillionPopulation = false;
  List<dynamic> _totalDeathsPerMillionPopulation;

  @override
  List<dynamic> get totalDeathsPerMillionPopulation {
    if (_didtotalDeathsPerMillionPopulation == false) {
      _didtotalDeathsPerMillionPopulation = true;
      _totalDeathsPerMillionPopulation = countryreport
          .map((e) => e['totalDeathsPerMillionPopulation'])
          .toList();
    }
    return _totalDeathsPerMillionPopulation;
  }

  bool _didfR = false;
  List<dynamic> _fR;

  @override
  List<dynamic> get fR {
    if (_didfR == false) {
      _didfR = true;
      _fR = countryreport.map((e) => e['FR']).toList();
    }
    return _fR;
  }

  bool _didpR = false;
  List<dynamic> _pR;

  @override
  List<dynamic> get pR {
    if (_didpR == false) {
      _didpR = true;
      _pR = countryreport.map((e) => e['PR']).toList();
    }
    return _pR;
  }

  bool _didlastUpdated = false;
  List<dynamic> _lastUpdated;

  @override
  List<dynamic> get lastUpdated {
    if (_didlastUpdated == false) {
      _didlastUpdated = true;
      _lastUpdated = countryreport.map((e) => e['lastUpdated']).toList();
    }
    return _lastUpdated;
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CountryReport(countryreport: $countryreport, countryCode: $countryCode, country: $country, totalConfirmed: $totalConfirmed, totalDeaths: $totalDeaths, totalRecovered: $totalRecovered, dailyConfirmed: $dailyConfirmed, dailyDeaths: $dailyDeaths, activeCases: $activeCases, totalCritical: $totalCritical, totalConfirmedPerMillionPopulation: $totalConfirmedPerMillionPopulation, totalDeathsPerMillionPopulation: $totalDeathsPerMillionPopulation, fR: $fR, pR: $pR, lastUpdated: $lastUpdated)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CountryReport'))
      ..add(DiagnosticsProperty('countryreport', countryreport))
      ..add(DiagnosticsProperty('countryCode', countryCode))
      ..add(DiagnosticsProperty('country', country))
      ..add(DiagnosticsProperty('totalConfirmed', totalConfirmed))
      ..add(DiagnosticsProperty('totalDeaths', totalDeaths))
      ..add(DiagnosticsProperty('totalRecovered', totalRecovered))
      ..add(DiagnosticsProperty('dailyConfirmed', dailyConfirmed))
      ..add(DiagnosticsProperty('dailyDeaths', dailyDeaths))
      ..add(DiagnosticsProperty('activeCases', activeCases))
      ..add(DiagnosticsProperty('totalCritical', totalCritical))
      ..add(DiagnosticsProperty('totalConfirmedPerMillionPopulation',
          totalConfirmedPerMillionPopulation))
      ..add(DiagnosticsProperty(
          'totalDeathsPerMillionPopulation', totalDeathsPerMillionPopulation))
      ..add(DiagnosticsProperty('fR', fR))
      ..add(DiagnosticsProperty('pR', pR))
      ..add(DiagnosticsProperty('lastUpdated', lastUpdated));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CountryReport &&
            (identical(other.countryreport, countryreport) ||
                const DeepCollectionEquality()
                    .equals(other.countryreport, countryreport)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(countryreport);

  @override
  _$CountryReportCopyWith<_CountryReport> get copyWith =>
      __$CountryReportCopyWithImpl<_CountryReport>(this, _$identity);
}

abstract class _CountryReport implements CountryReport {
  factory _CountryReport(dynamic countryreport) = _$_CountryReport;

  @override
  dynamic get countryreport;
  @override
  _$CountryReportCopyWith<_CountryReport> get copyWith;
}
