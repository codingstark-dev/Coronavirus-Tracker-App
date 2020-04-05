import 'package:coronatracker/constant/routung_constant.dart';
import 'package:coronatracker/screen/about.dart';
import 'package:coronatracker/screen/country_details.dart';
import 'package:coronatracker/screen/loading.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => LoadingPAgee());
    case AboutMEE:
      return MaterialPageRoute(builder: (context) => AboutMe());
    case DetailPageCountry:
      return MaterialPageRoute(builder: (context) => DetailPage());
    default:
      return MaterialPageRoute(builder: (context) => LoadingPAgee());
  }
}
