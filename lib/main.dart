import 'dart:async';

import 'package:coronatracker/Service_Locator/locator.dart';
import 'package:coronatracker/constant/routung_constant.dart';
import 'package:coronatracker/http/fetch_api.dart';
import 'package:coronatracker/provider/boolstates.dart';
import 'package:coronatracker/provider/getGlobal.dart';
import 'package:coronatracker/provider/getsinglereport.dart';
import 'package:coronatracker/provider/newsfetch.dart';
import 'package:coronatracker/screen/body.dart';
import 'package:coronatracker/screen/loading.dart';
import 'package:coronatracker/service/analytics_service.dart';
import 'package:coronatracker/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:coronatracker/service/connectivity_service.dart';
import 'enums/connectivity_status.dart';
import 'constant/allConstant.dart';
import 'package:coronatracker/named_route.dart' as router;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() {
  serviceLocator();
  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runZoned(() {
    runApp(MaterialApp(
      navigatorObservers: [sl<AnalyticsService>().getAnalyticsObserver()],
      onGenerateRoute: router.generateRoute,
      initialRoute: HomeViewRoute,
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
          providers: <SingleChildWidget>[
            ChangeNotifierProvider<DataState>(
              create: (context) => DataState(),
            ),
            StreamProvider<ConnectivityStatus>(
                create: (_) =>
                    ConnectivityService().connectionStatusController.stream),
          ],
          child: FutureBuilder(
              future: Future.delayed(Duration(seconds: 6)),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingPAgee();
                }
                return Wrapper();
              })),
    ));
  }, onError: Crashlytics.instance.recordError);
}

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    final DataState dataState = Provider.of<DataState>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(0, 65),
        child: AppBar(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 12, 8, 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        alignment: Alignment.center,
                        color: GREY_LIGHT,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 5,
                            ),
                            Text('EN',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: GREEN_COLOR,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: GREEN_COLOR,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 13, 8, 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: SizedBox(
                  height: 30,
                  width: 50,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(border: Border.all(color: GREEN_COLOR)),
                    child: IconButton(
                        color: GREEN_COLOR,
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          setState(() {
                            (dataState.menuDropDowm == false)
                                ? dataState.boolChanger2(true)
                                : dataState.boolChanger2(false);
                          });
                        }),
                  ),
                ),
              ),
            ),
          ],
          leading: Padding(
            padding: EdgeInsets.fromLTRB(14, 10, 0, 0),
            child: Image.asset('assets/images/coronatracker.png'),
          ),
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Covid-19-',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: 'Tracker',
                  style: TextStyle(
                      color: DARK_RED_LIGHT,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))
            ])),
          ),
          elevation: 1.5,
        ),
      ),
      body: MultiProvider(providers: <SingleChildWidget>[
        ChangeNotifierProvider<NewsFetch>(
          create: (context) => NewsFetch(),
        ),
        ChangeNotifierProvider<SingleReport>(
          create: (context) => SingleReport(),
        ),
        ChangeNotifierProvider<GetGlobal>(
          create: (context) => GetGlobal(),
        ),
        ChangeNotifierProvider<ApiData>(
          create: (context) => ApiData(),
        )
      ], child: BodyContainer()),
    );
  }
}
