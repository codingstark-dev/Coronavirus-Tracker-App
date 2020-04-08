import 'package:coronatracker/Freezed/covid_freezed.dart';
import 'package:coronatracker/http/api.dart';
import 'package:flutter/foundation.dart';

class SingleReport with ChangeNotifier {
  CountryReport countryReport;
  Country country;
  CountryReport countryReport2;
  Future<CountryReport> getcountrydata() async {
    //fetching data from API
    NetworkAPI networkAPI =
        NetworkAPI('http://api.coronatracker.com/v3/stats/worldometer/country');
    List<dynamic> apidata = await networkAPI.getData();
    // Map items = apidata['items'];
    countryReport = CountryReport(apidata);

    // print(countryReport.countryCode);
    notifyListeners();
    return countryReport;
  }

  Future<Country> getglobaldata() async {
    //fetching data from API
    NetworkAPI networkAPI =
        NetworkAPI('http://api.coronatracker.com/v3/stats/worldometer/Global');
    var data = await networkAPI.getData();
    // Map items = apidata['items'];
    // SingleReport().selectCountry(data);
    final lol = Country(
        activeCases: data['activeCases'] ?? 0,
        dailyConfirmed: data['dailyConfirmed'] ?? 0,
        dailyDeaths: data['dailyDeaths'] ?? 0,
        fR:  data['FR']?? '',
        pR: data['PR'] ?? '',
        lastUpdated: data['lastUpdated'] ?? '',
        totalConfirmedPerMillionPopulation:
            data['totalConfirmedPerMillionPopulation'] ?? 0,
        totalCritical: data['totalCritical'] ?? 0,
        totalDeathsPerMillionPopulation:
            data['totalDeathsPerMillionPopulation'] ?? 0,
        countryCode: data['countryCode'] ?? '',
        country: data['country'] ?? '',
        totalConfirmed: data['totalConfirmed'] ?? 0,
        totalDeaths: data['totalDeaths'] ?? '',
        totalRecovered: data['totalRecovered'] ?? 0);
    final dataa = lol.toJson();
    country = Country.fromJson(dataa);
    // print(countryReport.countryCode);
    notifyListeners();
    return country;
  }

  selectCountry(data) {
    final lol = Country(
        activeCases: data['activeCases'] ?? 0,
        dailyConfirmed: data['dailyConfirmed'] ?? 0,
        dailyDeaths: data['dailyDeaths'] ?? 0,
        fR: data['FR'] ?? '',
        pR:data['PR'] ?? '',
        lastUpdated: data['lastUpdated'] ?? '',
        totalConfirmedPerMillionPopulation:
            data['totalConfirmedPerMillionPopulation'] ?? 0,
        totalCritical: data['totalCritical'] ?? 0,
        totalDeathsPerMillionPopulation:
            data['totalDeathsPerMillionPopulation'] ?? 0,
        countryCode: data['countryCode'] ?? '',
        country: data['country'] ?? '',
        totalConfirmed: data['totalConfirmed'] ?? 0,
        totalDeaths: data['totalDeaths'] ?? '',
        totalRecovered: data['totalRecovered'] ?? 0);
    final dataa = lol.toJson();
    country = Country.fromJson(dataa);
    print(country);
    return country;
  }

  listofcountry(countryreport) {
    countryReport2 = CountryReport(countryreport);
    return countryReport2;
  }
}
