import 'dart:async';

import 'package:coronatracker/Freezed/covid_freezed.dart';
import 'package:coronatracker/constant/allConstant.dart';
import 'package:coronatracker/constant/routung_constant.dart';
import 'package:coronatracker/provider/boolstates.dart';
import 'package:coronatracker/provider/getsinglereport.dart';
import 'package:coronatracker/provider/newsfetch.dart';
import 'package:coronatracker/widget/dropdown_search.dart';
import 'package:coronatracker/Service_Locator/locator.dart';
import 'package:coronatracker/widget/menudropdown.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:coronatracker/http/fetch_api.dart';
import 'package:provider/provider.dart';
import 'news.dart';

class BodyContainer extends StatefulWidget {
  BodyContainer({Key key}) : super(key: key);

  @override
  _BodyContainerState createState() => _BodyContainerState();
}

class _BodyContainerState extends State<BodyContainer> {
  // AllCountry allCountry;
  bool menuDrop = false;
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  bool showall = false;
  bool ssssss = false;
  Timer timer;
  Timer timer2;
  Timer timer3;

  // final _pageController = PageController();
  ScrollController _scrollController1;
  ScrollController _scrollController2;
  ScrollController _scrollController3;
  ScrollController _scrollController4;
  final _scrollControllerGroup = LinkedScrollControllerGroup();

  @override
  void dispose() {
    timer?.cancel();
    // Don't forget to dispose all of your controllers!
    // _pageController.dispose();
    _scrollController1.dispose();
    _scrollController2.dispose();
    _scrollController3.dispose();
    _scrollController4.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    updateAllCountry();
    // updateAllCountrsss();
    Provider.of<SingleReport>(context, listen: false).getcountrydata();
    // final country = Provider.of<GetGlobal>(context, listen: false);
    Provider.of<SingleReport>(context, listen: false).getglobaldata();
    Provider.of<NewsFetch>(context, listen: false).getVirusData('50');
    timer = Timer.periodic(Duration(minutes: 2), (Timer t) {
      return Provider.of<SingleReport>(context, listen: false).getglobaldata();
    });
    timer2 = Timer.periodic(Duration(minutes: 2), (Timer t) {
      return Provider.of<SingleReport>(context, listen: false).getcountrydata();
    });
    timer3 = Timer.periodic(Duration(minutes: 2), (Timer t) {
      return Provider.of<NewsFetch>(context, listen: false).getVirusData('100');
    });
    // Create separate ScrollControllers as you need them:
    _scrollController1 = _scrollControllerGroup.addAndGet();
    _scrollController2 = _scrollControllerGroup.addAndGet();
    _scrollController3 = _scrollControllerGroup.addAndGet();
    _scrollController4 = _scrollControllerGroup.addAndGet();
  }

  Function mathFunc = (Match match) => '${match[1]},';

  Future updateAllCountry() async {
    // final dynamic data = await sl.get<ApiData>().getVirusData('global');
    // final dynamic pros = sl.get<BoolChecker>();
    final datas = await sl.get<ApiData>().getVirusData('global');
    final DataState boolChecker =
        Provider.of<DataState>(context, listen: false);
    // pros.lol.clear();
    boolChecker.lol.clear();
    setState(() {
      boolChecker.datachanged(datas);
    });
    boolChecker.apidatatass(0);
    // setState(() {
    //   if (data == null) {
    //     final lol = Country(totalConfirmed: 0, totalDeaths: 0, totalRecovered: 0);
    //     final dataa = lol.toJson();
    //     country = Country.fromJson(dataa);
    //   }
    //   final lol = Country(
    //       totalConfirmed: data['totalConfirmed'],
    //       totalDeaths: data['totalDeaths'],
    //       totalRecovered: data['totalRecovered']);
    //   final dataa = lol.toJson();
    //   country = Country.fromJson(dataa);
    //   print(country.totalConfirmed);
    // });
  }

  // Future updateAllCountrsss() async {
  //   final dynamic data = await sl.get<ApiData>().getVirusData('country');
  //   // print(data);

  //   // print(i);

  //   final lol = AllCountry(
  //       // countryCode: data[i]['countryCode'],
  //       totalConfirmed: data,
  //       totalDeaths: data,
  //       totalRecovered: data,
  //       country: data,
  //       countryCode: data);
  //   final dataa = lol.toJson();
  //   allCountry = AllCountry.fromJson(dataa);
  //   // print(allCountry.totalConfirmed);
  //   return allCountry;
  // }

  Widget _buildcolum(String title, int n, SingleReport singleReport) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration:
              BoxDecoration(border: Border.all(color: Color(0xffe2e8f0))),
          width: 100,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Text(
              "$title",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            controller: _scrollController1,
            itemCount: n,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 100,
                height: 40,
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xffe2e8f0))),
                child: Container(
                  color: GREY_LIGHT,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, DetailPageCountry,
                              arguments: Country(
                                  activeCases: singleReport
                                      .countryReport.activeCases[index],
                                  dailyConfirmed: singleReport
                                      .countryReport.dailyConfirmed[index],
                                  dailyDeaths: singleReport
                                      .countryReport.dailyDeaths[index],
                                  fR: singleReport.countryReport.fR[index],
                                  pR: singleReport.countryReport.pR[index],
                                  lastUpdated: singleReport
                                      .countryReport.lastUpdated[index],
                                  totalConfirmedPerMillionPopulation: singleReport
                                          .countryReport
                                          .totalConfirmedPerMillionPopulation[
                                      index],
                                  totalCritical: singleReport
                                      .countryReport.totalCritical[index],
                                  totalDeathsPerMillionPopulation: singleReport
                                      .countryReport
                                      .totalDeathsPerMillionPopulation[index],
                                  countryCode: singleReport.countryReport.countryCode[index],
                                  country: singleReport.countryReport.country[index],
                                  totalConfirmed: singleReport.countryReport.totalConfirmed[index],
                                  totalDeaths: singleReport.countryReport.totalDeaths[index],
                                  totalRecovered: singleReport.countryReport.totalRecovered[index]));
                          // print(singleReport.countryReport.country[index]);
                        },
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset((singleReport.countryReport
                                                .countryCode[index]
                                                .toString()
                                                .toLowerCase() ==
                                            null ||
                                        singleReport.countryReport
                                                .countryCode[index]
                                                .toString()
                                                .toLowerCase() ==
                                            'null' ||
                                        singleReport.countryReport
                                                .countryCode[index]
                                                .toString()
                                                .toLowerCase() ==
                                            '')
                                    ? 'assets/h20-webp/lols.webp'
                                    : 'assets/h20-webp/${singleReport.countryReport.countryCode[index].toString().toLowerCase()}.webp')),
                            Text(
                              "${singleReport.countryReport.country[index]}"
                                  .replaceAllMapped(reg, mathFunc),
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildcolum2(String title, int n, SingleReport singleReport) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration:
              BoxDecoration(border: Border.all(color: Color(0xffe2e8f0))),
          width: 100,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Text(
              "$title",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            controller: _scrollController2,
            itemCount: n,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                width: 100,
                height: 40,
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xffe2e8f0))),
                child: Text(
                  "${singleReport.countryReport.totalConfirmed[index]}"
                      .replaceAllMapped(reg, mathFunc),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildcolum3(String title, int n, SingleReport singleReport) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration:
              BoxDecoration(border: Border.all(color: Color(0xffe2e8f0))),
          width: 100,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Text(
              "$title",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            controller: _scrollController3,
            itemCount: n,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                width: 100,
                height: 40,
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xffe2e8f0))),
                child: Text(
                  "${singleReport.countryReport.totalRecovered[index]}"
                      .replaceAllMapped(reg, mathFunc),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildcolum4(String title, int n, SingleReport singleReport) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration:
              BoxDecoration(border: Border.all(color: Color(0xffe2e8f0))),
          width: 100,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Text(
              "$title",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            controller: _scrollController4,
            itemCount: n,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                width: 100,
                height: 40,
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xffe2e8f0))),
                child: Text(
                  "${singleReport.countryReport.totalDeaths[index]}"
                      .replaceAllMapped(reg, mathFunc),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  buildColumn(DataState checker, double query, NewsFetch newsData,
      SingleReport singleReport) {
    return FutureBuilder(
      future: sl.get<ApiData>().getVirusData('global'),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              (checker.menuDropDowm == false)
                  ? Container()
                  : MenuDropDownTopBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          clipBehavior: Clip.hardEdge,
                          elevation: 1.8,
                          child: SizedBox(
                            width: 1000 / query,
                            height: (checker.menuDown == false) ? 330 : 540,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(15.0, 0, 15, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 18,
                                        width: 18,
                                        child: FlareActor(
                                            'assets/flare/lolllld.flr',
                                            fit: BoxFit.contain,
                                            alignment: Alignment.center,
                                            animation: "Untitled"),
                                      ),
                                      Text(
                                        'LIVE',
                                        style: TextStyle(
                                            color: DARK_RED_LIGHT,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 140,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: FlatButton.icon(
                                            hoverColor: Colors.blueAccent,
                                            onPressed: () =>
                                                singleReport.getglobaldata(),
                                            icon: Icon(
                                              Icons.refresh,
                                              color: Colors.green,
                                            ),
                                            label: Text(
                                              "Refresh",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                      // Text(
                                      //   'Refresh',
                                      //   style: TextStyle(
                                      //       color: Colors.green,
                                      //       fontSize: 15,
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Stats Overview',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 8.0, 0, 0),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              (checker.menuDown == false)
                                                  ? checker.menuDown = true
                                                  : checker.menuDown = false;
                                            });
                                            checker.lolee.clear();
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Container(
                                              height: 36,
                                              width: 400,
                                              color: GREY_LIGHT,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: <Widget>[
                                                  (singleReport.country
                                                                  ?.countryCode ==
                                                              null ||
                                                          singleReport.country
                                                                  .countryCode ==
                                                              "")
                                                      ? FaIcon(
                                                          FontAwesomeIcons
                                                              .globe,
                                                          color: Colors.black87,
                                                          size: 20,
                                                        )
                                                      : Image.asset(
                                                          'assets/h20-webp/${singleReport.country.countryCode.toString().toLowerCase()}.webp',
                                                          height: 20,
                                                          width: 25,
                                                          cacheHeight: 20,
                                                          cacheWidth: 25,
                                                        ),
                                                  (singleReport.country
                                                              ?.country ==
                                                          "")
                                                      ? Text('Global',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black87,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))
                                                      : Text(
                                                          '${singleReport.country?.country}',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black87,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                  SizedBox(
                                                    width: 10.0 * 10,
                                                  ),
                                                  Icon(
                                                      Icons.keyboard_arrow_down)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      (checker.menuDown == false)
                                          ? Container()
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 43, 0, 0),
                                              child: FutureBuilder(
                                                future: sl
                                                    .get<ApiData>()
                                                    .getVirusData('global'),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<dynamic>
                                                        snapshot) {
                                                  if (snapshot.hasData) {
                                                    return DropDownWidget(
                                                      buttonAction: () {},
                                                    );
                                                  } else {
                                                    return Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  }
                                                },
                                              ),
                                            )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  (checker.menuDown == false)
                                      ? FutureBuilder(
                                          future: sl
                                              .get<ApiData>()
                                              .getVirusData('global'),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<dynamic> snapshot) {
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }

                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: <Widget>[
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Card(
                                                      child: Column(
                                                        children: <Widget>[
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            color: DARK_RED,
                                                            height: 50,
                                                            width: 110,
                                                            child: Text(
                                                              '${singleReport.country?.totalConfirmed}'
                                                                      .replaceAllMapped(
                                                                          reg,
                                                                          mathFunc) ??
                                                                  '0',
                                                              style: TextStyle(
                                                                  color:
                                                                      DARK_RED_LIGHT,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              color: Color(
                                                                  0xfffed7d7),
                                                              height: 40,
                                                              width: 110,
                                                              child: Text(
                                                                'Confirmed',
                                                                style: TextStyle(
                                                                    color:
                                                                        DARK_RED_LIGHT,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Card(
                                                      child: Column(
                                                        children: <Widget>[
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            color: Color(
                                                                0xfff0fff4),
                                                            height: 50,
                                                            width: 120,
                                                            child: Text(
                                                              '${singleReport.country?.totalRecovered}'
                                                                      .replaceAllMapped(
                                                                          reg,
                                                                          mathFunc) ??
                                                                  '0',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff38a169),
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              color: Color(
                                                                  0xffc6f6d5),
                                                              height: 40,
                                                              width: 120,
                                                              child: Text(
                                                                'Recovered',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff38a169),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Card(
                                                      child: Column(
                                                        children: <Widget>[
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            color: Color(
                                                                0xfffedf2f7),
                                                            height: 50,
                                                            width: 120,
                                                            child: Text(
                                                              '${singleReport.country?.totalDeaths}'
                                                                      .replaceAllMapped(
                                                                          reg,
                                                                          mathFunc) ??
                                                                  '0',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff718096),
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              color: Color(
                                                                  0xffe2e8f0),
                                                              height: 40,
                                                              width: 120,
                                                              child: Text(
                                                                'Deaths',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff718096),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        )
                                      : Container(),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (singleReport.country.lastUpdated !=
                                          "") {
                                        Navigator.pushNamed(
                                            context, DetailPageCountry,
                                            arguments: singleReport.country);
                                      } else {
                                        Fluttertoast.showToast(
                                            msg:
                                                'Please select country to see details!');
                                      }
                                      // print(singleReport.country);

                                      // print(singleReport
                                      //     .countryReport.activeCases);
                                    },
                                    child: Center(
                                        child: Text(
                                      'More Details',
                                      style: TextStyle(
                                          color: Color(0xff4299e1),
                                          fontWeight: FontWeight.bold),
                                    )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                        //   child: Container(
                        //     child: Text(
                        //       ' Source: Indian Government, Mygov.in, Covid19india.org  ',
                        //       style: TextStyle(
                        //           color: Color(0xffa0aec0),
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.w500),
                        //     ),
                        //   ),
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.pushNamed(context, DetailPageCountry,
                        //         arguments: Country(
                        //             activeCases: singleReport
                        //                 .countryReport.activeCases[1],
                        //             dailyConfirmed: singleReport
                        //                 .countryReport.dailyConfirmed[1],
                        //             dailyDeaths: singleReport
                        //                 .countryReport.dailyDeaths[1],
                        //             fR: singleReport.countryReport.fR[1],
                        //             pR: singleReport.countryReport.pR[1],
                        //             lastUpdated: singleReport
                        //                 .countryReport.lastUpdated[1],
                        //             totalConfirmedPerMillionPopulation: singleReport
                        //                 .countryReport
                        //                 .totalConfirmedPerMillionPopulation[1],
                        //             totalCritical: singleReport
                        //                 .countryReport.totalCritical[1],
                        //             totalDeathsPerMillionPopulation:
                        //                 singleReport.countryReport
                        //                     .totalDeathsPerMillionPopulation[1],
                        //             countryCode: singleReport
                        //                 .countryReport.countryCode[1],
                        //             country: singleReport.countryReport.country[1],
                        //             totalConfirmed: singleReport.countryReport.totalConfirmed[1],
                        //             totalDeaths: singleReport.countryReport.totalDeaths[1],
                        //             totalRecovered: singleReport.countryReport.totalRecovered[1]));
                        //   },
                        //   child: Container(
                        //     height: 60,
                        //     child: Padding(
                        //       padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 5),
                        //       child: Card(
                        //         elevation: 2.3,
                        //         child: Row(
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: <Widget>[
                        //             Row(
                        //               children: <Widget>[
                        //                 Padding(
                        //                   padding: const EdgeInsets.all(6.0),
                        //                   child: Image.asset(
                        //                     'assets/h20-webp/in.webp',
                        //                     width: 20,
                        //                     height: 20,
                        //                   ),
                        //                 ),
                        //                 Padding(
                        //                   padding: const EdgeInsets.all(8.0),
                        //                   child: Text(
                        //                     "India Covid-19 (Live Report - Beta)",
                        //                     textAlign: TextAlign.center,
                        //                     style: TextStyle(
                        //                         color: GREEN_COLOR,
                        //                         fontWeight: FontWeight.bold,
                        //                         fontSize: 16),
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //             Icon(
                        //               Icons.arrow_forward_ios,
                        //               color: GREEN_COLOR,
                        //             )
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              ' FAQs By WHO -',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xffa0aec0),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, FAQSpage),
                          child: Container(
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 5),
                              child: Card(
                                elevation: 2.3,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "FAQs",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: GREEN_COLOR,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: GREEN_COLOR,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )

                        // InkWell(
                        //   onTap: () {
                        //     launch(
                        //         'https://docs.google.com/forms/d/e/1FAIpQLSeIZifaTuimdpdO4GDhV5Oz35xN1xvtiLIgPN1uSLwii7dnLw/closedform');
                        //   },
                        //   child: Container(
                        //     alignment: Alignment.topCenter,
                        //     child: SizedBox(
                        //       width: 1000 / query,
                        //       height: 130,
                        //       child: Image.asset(
                        //         'assets/images/survey_mobile.png',
                        //         alignment: Alignment.topCenter,
                        //         filterQuality: FilterQuality.high,
                        //         fit: BoxFit.contain,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // DropDownWidget(),
                        ,
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 5,
                                height: 40,
                                color: GREEN_COLOR,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: ssssss == false
                                    ? () {
                                        singleReport.getcountrydata();
                                      }
                                    : null,
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'COUNTRIES AFFECTED',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: GREEN_COLOR,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.refresh,
                                        color: GREEN_COLOR,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                          child: Container(
                            child: Text(
                              'Source: WHO, CDC, ECDC, NHC of the PRC, JHU CSSE, DXY, QQ, and various international media',
                              style: TextStyle(
                                  color: Color(0xffa0aec0),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: 1000 / query,
                            height: (showall == false) ? 400 : 420,
                            child: PageView(
                              children: <Widget>[
                                FutureBuilder(
                                  future:
                                      sl.get<ApiData>().getVirusData('country'),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<dynamic> snapshot) {
                                    if (snapshot.hasData) {
                                      return Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 2,
                                              child: _buildcolum(
                                                  'Country',
                                                  (showall == false)
                                                      ? 10
                                                      : singleReport
                                                          .countryReport
                                                          .country
                                                          .length,
                                                  singleReport)),
                                          Expanded(
                                              child: _buildcolum2(
                                                  'Confirmed',
                                                  (showall == false)
                                                      ? 10
                                                      : singleReport
                                                          .countryReport
                                                          .country
                                                          .length,
                                                  singleReport)),
                                          Expanded(
                                              child: _buildcolum3(
                                                  'Recovered',
                                                  (showall == false)
                                                      ? 10
                                                      : singleReport
                                                          .countryReport
                                                          .country
                                                          .length,
                                                  singleReport)),
                                          Expanded(
                                              child: _buildcolum4(
                                                  'Deaths',
                                                  (showall == false)
                                                      ? 10
                                                      : singleReport
                                                          .countryReport
                                                          .country
                                                          .length,
                                                  singleReport)),
                                          // Expanded(child: _buildcolum('dddd', 10)),
                                        ],
                                      );
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "* Cases identified on a cruise ship currently in Japanese territorial waters.",
                            style: TextStyle(
                                color: DARK_GREY, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 200,
                          height: 30,
                          child: FlatButton(
                              textColor: Colors.blue,
                              onPressed: () {
                                setState(() {});
                                showall = !showall;
                              },
                              child: Text(
                                (showall == false)
                                    ? 'Show All Country'
                                    : 'Show Top Country',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 5,
                                height: 40,
                                color: GREEN_COLOR,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: ssssss == false
                                    ? () {
                                        newsData.getVirusData('50');
                                      }
                                    : null,
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'VERIFIED NEWS',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: GREEN_COLOR,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.refresh,
                                        color: GREEN_COLOR,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        NewsSection()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final singlecountry = Provider.of<SingleReport>(context, listen: true);
    final query = MediaQuery.of(context).devicePixelRatio;
    final DataState checker = Provider.of<DataState>(context, listen: true);
    final newsData = Provider.of<NewsFetch>(context);
    // print(checker.country?.totalConfirmed);
    return buildColumn(checker, query, newsData, singlecountry);
  }
}
