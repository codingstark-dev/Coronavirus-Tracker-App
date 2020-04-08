import 'package:coronatracker/constant/routung_constant.dart';
import 'package:coronatracker/screen/about.dart';
import 'package:coronatracker/screen/country_details.dart';
import 'package:coronatracker/screen/loading.dart';
import 'package:coronatracker/screen/page/faq.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/newsfetch.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => LoadingPAgee());
    case AboutMEE:
      return MaterialPageRoute(builder: (context) => AboutMe());
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
    case FAQSpage:
      return MaterialPageRoute(builder: (context) => FAQPage());
    default:
      return MaterialPageRoute(builder: (context) => LoadingPAgee());
  }
}
