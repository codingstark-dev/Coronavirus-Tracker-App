import 'package:coronatracker/Freezed/covid_freezed.dart';
import 'package:coronatracker/http/api.dart';
import 'package:flutter/foundation.dart';

import 'getsinglereport.dart';

class GetGlobal with ChangeNotifier {
  Country country;

  Future getglobaldata() async {
    //fetching data from API
    NetworkAPI networkAPI =
        NetworkAPI('http://api.coronatracker.com/v3/stats/worldometer/Global');
    var data = await networkAPI.getData();
    // Map items = apidata['items'];
    // SingleReport().selectCountry(data);
    final lol = Country(
        countryCode: data['countryCode'],
        country: data['country'],
        totalConfirmed: data['totalConfirmed'],
        totalDeaths: data['totalDeaths'],
        totalRecovered: data['totalRecovered']);
    final dataa = lol.toJson();
    country = Country.fromJson(dataa);
    // print(countryReport.countryCode);
    notifyListeners();
    return country;
  }

  // selectCountry(data) {
  //   final lol = Country(
  //       countryCode: data['countryCode'],
  //       country: data['country'],
  //       confirmed: data['totalConfirmed'],
  //       death: data['totalDeaths'],
  //       recover: data['totalRecovered']);
  //   final dataa = lol.toJson();
  //   country = Country.fromJson(dataa);
  //   print(country);
  //   return country;
  // }
}
