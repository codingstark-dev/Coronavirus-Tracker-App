import 'package:coronatracker/constant/routung_constant.dart';
import 'package:coronatracker/main.dart';
import 'package:coronatracker/provider/boolstates.dart';
import 'package:coronatracker/screen/about.dart';
import 'package:coronatracker/screen/country_details.dart';
import 'package:coronatracker/screen/loading.dart';
import 'package:coronatracker/screen/page/faq.dart';
import 'package:coronatracker/screen/page/indiaDetailPage.dart';
import 'package:coronatracker/screen/page/privacypolicy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/newsfetch.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => LoadingPAgee());
    case AboutMEE:
      return MaterialPageRoute(builder: (context) => AboutMe());
    case Privacypolicy:
      return MaterialPageRoute(builder: (context) => PrivacyPolicy());
    case CovidHome:
      return MaterialPageRoute(
          builder: (context) => MultiProvider(providers: [
                ChangeNotifierProvider<DataState>(
                  create: (context) => DataState(),
                )
              ], child: LoadingPage()));
    case DetailPageCountry:
      return MaterialPageRoute(
          builder: (context) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider<NewsFetch>(
                      create: (context) => NewsFetch(),
                    )
                  ],
                  child: DetailPage(
                    country: settings.arguments,
                  )));
    case IndiaDetails:
      return MaterialPageRoute(
          builder: (context) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider<NewsFetch>(
                      create: (context) => NewsFetch(),
                    )
                  ],
                  child: IndiaDetailPage(
                    country: settings.arguments,
                  )));
    case FAQSpage:
      return MaterialPageRoute(
          builder: (context) => MultiProvider(providers: [
                ChangeNotifierProvider<DataState>(
                  create: (context) => DataState(),
                )
              ], child: FAQPage()));
    default:
      return MaterialPageRoute(builder: (context) => LoadingPAgee());
  }
}
