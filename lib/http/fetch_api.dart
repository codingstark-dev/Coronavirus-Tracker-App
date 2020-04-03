import 'package:coronatracker/http/api.dart';
import 'package:flutter/foundation.dart';

class ApiData with ChangeNotifier {
  Future getVirusData(String data) async {
    //fetching data from API
    NetworkAPI networkAPI = NetworkAPI(
        'https://api.coronatracker.com/v3/stats/worldometer/$data');
    var virusData = networkAPI.getData();
    // print(virusData.toString());
    notifyListeners();
    return virusData;
  }

  // Future getAllCountryData() {
  //   NetworkAPI networkAPI = NetworkAPI(
  //       'http://api.coronatracker.com/v3/stats/worldometer/country');
  //   var data = networkAPI.getData();
  //   return data;
  // }
}
