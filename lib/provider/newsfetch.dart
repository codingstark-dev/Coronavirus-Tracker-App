import 'package:coronatracker/Freezed/covid_freezed.dart';
import 'package:coronatracker/http/api.dart';
import 'package:flutter/material.dart';

class NewsFetch with ChangeNotifier {
  NewsData newsData;

  Future<NewsData> getVirusData(String data) async {
    //fetching data from API
    NetworkAPI networkAPI = NetworkAPI(
        'https://api.coronatracker.com/news/trending?limit=$data&offset=0&language=en');
    Map apidata = await networkAPI.getData();
    List items = apidata['items'];
    newsData = NewsData(items);
    notifyListeners();
    return newsData;
  }
}
