import 'package:coronatracker/Freezed/covid_freezed.dart';
import 'package:flutter/foundation.dart';

class DataState with ChangeNotifier {
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
    final data = lolee.where((element) =>
        element[0]['country'].toString().contains('World'));
    print(data.toList().indexOf(0));
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
        countryFlag: lol[0]['countryCode'],
        countryName: lol[0]['country'],
        confirmed: lol[0]['totalConfirmed'],
        death: lol[0]['totalDeaths'],
        recover: lol[0]['totalRecovered']);
    final lola = los.toJson();
    notifyListeners();
    country = Country.fromJson(lola);
  }

  // void fetchGlobal() async {
  //   final dynamic data =
  //       await sl.get<ApiData>().getVirusData('global');
  //   // final dynamic pros = sl.get<DataState>();

  //   lol.clear();
  //   lol.add(data);
  //   // datachanged(data);
  //   // apidatatass(0);
  //   final los = Country(
  //       countryFlag: lol[0]['countryCode'],
  //       countryName: lol[0]['country'],
  //       confirmed: lol[0]['totalConfirmed'],
  //       death: lol[0]['totalDeaths'],
  //       recover: lol[0]['totalRecovered']);
  //   final lola = los.toJson();
  //   this.country = Country.fromJson(lola);
  //   boolChanger(false);
  //   notifyListeners();
  //   print(this.country.confirmed);
  //   // setState(() {
  //   //   if (data == null) {
  //   //     final lol = Country(confirmed: 0, death: 0, recover: 0);
  //   //     final dataa = lol.toJson();
  //   //     country = Country.fromJson(dataa);
  //   //   }
  //   //   final lol = Country(
  //   //       confirmed: data['totalConfirmed'],
  //   //       death: data['totalDeaths'],
  //   //       recover: data['totalRecovered']);
  //   //   final dataa = lol.toJson();
  //   //   country = Country.fromJson(dataa);
  //   //   print(country.confirmed);
  //   // });
  // }

//! bool
  bool boolChanger(dod) {
    notifyListeners();
    return menuDown = dod;
  }

  bool boolChanger2(dod) {
    notifyListeners();
    return menuDropDowm = dod;
  }
}
