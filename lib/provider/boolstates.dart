import 'package:coronatracker/Freezed/covid_freezed.dart';
import 'package:flutter/foundation.dart';

class BoolChecker with ChangeNotifier {
  bool menuDown = false;
  bool menuDropDowm = false;

  List lol = [];

  List lolee = [];

  Country country;
  AllCountry allCountry;
  List datachanged(ss) {
    lol.add(ss);
    notifyListeners();
    return lol;
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

  List datachangedss(ss) {
    lolee.add(ss);
    notifyListeners();
    return lolee;
  }

  void apidatata2(int i) {
    final dynamic los = AllCountry(
        countryCode: lolee[i],
        country: lolee[i],
        confirmed: lolee[i],
        death: lolee[i],
        recover: lolee[i]);
    final lola = los.toJson();
    notifyListeners();
    allCountry = AllCountry.fromJson(lola);
    // lolee = los;
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

  bool boolChanger2(dod) {
    notifyListeners();
    return menuDropDowm = dod;
  }
}
