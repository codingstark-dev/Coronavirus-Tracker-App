import 'package:coronatracker/Freezed/covid_freezed.dart';
import 'package:flutter/foundation.dart';

class BoolChecker with ChangeNotifier {
  bool menuDown = false;
  List lol = [];
  List lolee = [];
  Country country;
  AllCountry allCountry;
  List datachanged(ss) {
    lol.add(ss);
    notifyListeners();
    return lol;
  }

  List datachangedss(ss) {
    lolee.clear();
    lolee.add(ss);
    notifyListeners();
    return lolee;
  }

  void apidatata(int i) {
    final los = Country(
        countryFlag: lol[i]['countryCode'],
        countryName: lol[i]['country'],
        confirmed: lol[i]['totalConfirmed'],
        death: lol[i]['totalDeaths'],
        recover: lol[i]['totalRecovered']);
    final lola = los.toJson();
    notifyListeners();
    country = Country.fromJson(lola);
  }

  void apidatata2(int i) {
    final dynamic los = AllCountry(
        countryCode: lolee[0][i]['countryCode'],
        country: lolee[0][i]['country'],
        confirmed: lolee[0][i]['totalConfirmed'],
        death: lolee[0][i]['totalDeaths'],
        recover: lolee[0][i]['totalRecovered']);
    final lola = los.toJson();
    notifyListeners();
    allCountry = AllCountry.fromJson(lola);
    lolee = los;
  }

  void apidatatass(int i) {
    final los = Country(
        countryFlag: lol[i]['countryCode'],
        countryName: lol[i]['country'],
        confirmed: lol[i]['totalConfirmed'],
        death: lol[i]['totalDeaths'],
        recover: lol[i]['totalRecovered']);
    final lola = los.toJson();
    notifyListeners();
    country = Country.fromJson(lola);
  }

  bool boolChanger(dod) {
    notifyListeners();
    return menuDown = dod;
  }
}
