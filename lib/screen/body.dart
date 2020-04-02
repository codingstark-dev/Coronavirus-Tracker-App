import 'package:coronatracker/Freezed/covid_freezed.dart';
import 'package:coronatracker/constant/allConstant.dart';
import 'package:coronatracker/provider/boolstates.dart';
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
import 'package:coronatracker/enums/connectivity_status.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyContainer extends StatefulWidget {
  BodyContainer({Key key}) : super(key: key);

  @override
  _BodyContainerState createState() => _BodyContainerState();
}

class _BodyContainerState extends State<BodyContainer> {
  AllCountry allCountry;
  Country country;
  bool menuDrop = false;
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

  final _pageController = PageController();
  ScrollController _scrollController1;
  ScrollController _scrollController2;
  ScrollController _scrollController3;
  ScrollController _scrollController4;
  final _scrollControllerGroup = LinkedScrollControllerGroup();
  bool showall = false;
  @override
  void dispose() {
    // Don't forget to dispose all of your controllers!
    _pageController.dispose();
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
    updateAllCountrsss();
    // Create separate ScrollControllers as you need them:
    _scrollController1 = _scrollControllerGroup.addAndGet();
    _scrollController2 = _scrollControllerGroup.addAndGet();
    _scrollController3 = _scrollControllerGroup.addAndGet();
    _scrollController4 = _scrollControllerGroup.addAndGet();
  }

  Function mathFunc = (Match match) => '${match[1]},';

  Future updateAllCountry() async {
    final dynamic data = await sl.get<ApiData>().getVirusData();
    // final dynamic pros = sl.get<BoolChecker>();
    final BoolChecker boolChecker =
        Provider.of<BoolChecker>(context, listen: false);
    // pros.lol.clear();
    boolChecker.lol.clear();
    setState(() {
      boolChecker.datachanged(data);
    });
    boolChecker.apidatatass(0);
    // setState(() {
    //   if (data == null) {
    //     final lol = Country(confirmed: 0, death: 0, recover: 0);
    //     final dataa = lol.toJson();
    //     country = Country.fromJson(dataa);
    //   }
    //   final lol = Country(
    //       confirmed: data['totalConfirmed'],
    //       death: data['totalDeaths'],
    //       recover: data['totalRecovered']);
    //   final dataa = lol.toJson();
    //   country = Country.fromJson(dataa);
    //   print(country.confirmed);
    // });
  }

  void updateAllCountrsss() async {
    final dynamic data = await sl.get<ApiData>().getAllCountryData();
    // print(data);
    setState(() {
      // print(i);

      final lol = AllCountry(
          // countryCode: data[i]['countryCode'],
          confirmed: data,
          death: data,
          recover: data,
          country: data,
          countryCode: data);
      final dataa = lol.toJson();
      allCountry = AllCountry.fromJson(dataa);
      // print(allCountry.confirmed);
    });
  }

  Widget _buildcolum(String title, int n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffe2e8f0))),
          width: 100,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Text(
              "$title",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 13),
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
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffe2e8f0))),
                child: Container(
                  color: GREY_LIGHT,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: InkWell(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg:
                                  'This Feature Will Come Soon And Stay Tune!');
                        },
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(
                                    'assets/w2560-webp/${allCountry?.countryCode[index]['countryCode'].toString().toLowerCase()}.webp')),
                            Text(
                              "${allCountry.country[index]['country']}"
                                  .replaceAllMapped(reg, mathFunc),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500),
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

  Widget _buildcolum2(String title, int n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffe2e8f0))),
          width: 100,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Text(
              "$title",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 13),
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
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffe2e8f0))),
                child: Text(
                  "${allCountry?.confirmed[index]['totalConfirmed']}"
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

  Widget _buildcolum3(String title, int n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffe2e8f0))),
          width: 100,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Text(
              "$title",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 13),
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
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffe2e8f0))),
                child: Text(
                  "${allCountry.recover[index]['totalRecovered']}"
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

  Widget _buildcolum4(String title, int n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffe2e8f0))),
          width: 100,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: Text(
              "$title",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 13),
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
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffe2e8f0))),
                child: Text(
                  "${allCountry?.death[index]['totalDeaths']}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).devicePixelRatio;
    final BoolChecker checker = Provider.of<BoolChecker>(context);
    ConnectivityStatus connectionStatus =
        Provider.of<ConnectivityStatus>(context);
    print(connectionStatus);
    // print(checker.country?.confirmed);
    return buildColumn(checker, query);
  }

  Column buildColumn(BoolChecker checker, double query) {
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
                      height: (checker.menuDown == false) ? 330 : 500,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 0, 15, 0),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
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
                                      alignment: Alignment.center,
                                      fit: BoxFit.contain,
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
                                          updateAllCountry(),
                                      icon: Icon(
                                        Icons.refresh,
                                        color: Colors.green,
                                      ),
                                      label: Text(
                                        "Refresh",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.bold),
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
                                            : checker.menuDown =
                                                false;
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
                                              CrossAxisAlignment
                                                  .center,
                                          mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                          children: <Widget>[
                                            (checker.country?.countryFlag ==
                                                        null ||
                                                    checker.country
                                                            .countryFlag ==
                                                        "")
                                                ? FaIcon(
                                                    FontAwesomeIcons
                                                        .globe,
                                                    color: Colors
                                                        .black87,
                                                    size: 20,
                                                  )
                                                : Image.asset(
                                                    'assets/w2560-webp/${checker.country.countryFlag.toString().toLowerCase()}.webp',
                                                    height: 20,
                                                    width: 25,
                                                    cacheHeight: 20,
                                                    cacheWidth: 25,
                                                  ),
                                            (checker.country
                                                        ?.countryName ==
                                                    "")
                                                ? Text(
                                                    'Global',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .black87,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight
                                                                .bold))
                                                : Text(
                                                    '${checker.country?.countryName}',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .black87,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight
                                                                .bold)),
                                            SizedBox(
                                              width: 120,
                                            ),
                                            Icon(Icons
                                                .keyboard_arrow_down)
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
                                              .getAllCountryData(),
                                          builder: (BuildContext
                                                  context,
                                              AsyncSnapshot<dynamic>
                                                  snapshot) {
                                            if (snapshot.hasData) {
                                              return DropDownWidget(
                                                buttonAction: () {},
                                                countryCode:
                                                    allCountry
                                                        .countryCode,
                                                countrySelect:
                                                    allCountry
                                                        .country,
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
                                        .getVirusData(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<dynamic>
                                            snapshot) {
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child:
                                              CircularProgressIndicator(),
                                        );
                                      }

                                      return SingleChildScrollView(
                                        scrollDirection:
                                            Axis.horizontal,
                                        child: Row(
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius
                                                      .circular(5),
                                              child: Card(
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      alignment:
                                                          Alignment
                                                              .center,
                                                      color: DARK_RED,
                                                      height: 50,
                                                      width: 110,
                                                      child: Text(
                                                        '${checker.country?.confirmed}'.replaceAllMapped(
                                                                reg,
                                                                mathFunc) ??
                                                            '0',
                                                        style: TextStyle(
                                                            color:
                                                                DARK_RED_LIGHT,
                                                            fontSize:
                                                                18,
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
                                                                  FontWeight.w500),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius
                                                      .circular(5),
                                              child: Card(
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      alignment:
                                                          Alignment
                                                              .center,
                                                      color: Color(
                                                          0xfff0fff4),
                                                      height: 50,
                                                      width: 120,
                                                      child: Text(
                                                        '${checker.country?.recover}'.replaceAllMapped(
                                                                reg,
                                                                mathFunc) ??
                                                            '0',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff38a169),
                                                            fontSize:
                                                                18,
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
                                                                  FontWeight.w500),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius
                                                      .circular(5),
                                              child: Card(
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      alignment:
                                                          Alignment
                                                              .center,
                                                      color: Color(
                                                          0xfffedf2f7),
                                                      height: 50,
                                                      width: 120,
                                                      child: Text(
                                                        '${checker.country?.death}'.replaceAllMapped(
                                                                reg,
                                                                mathFunc) ??
                                                            '0',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff718096),
                                                            fontSize:
                                                                18,
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
                                                                  FontWeight.w500),
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
                                Fluttertoast.showToast(
                                    msg:
                                        'This Feature Will Come Soon And Stay Tune!');
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
                  InkWell(
                    onTap: () {
                      launch(
                          'https://docs.google.com/forms/d/e/1FAIpQLSeIZifaTuimdpdO4GDhV5Oz35xN1xvtiLIgPN1uSLwii7dnLw/closedform');
                    },
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: 1000 / query,
                        height: 130,
                        child: Image.asset(
                          'assets/images/survey_mobile.png',
                          alignment: Alignment.topCenter,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  // DropDownWidget(),
                  SizedBox(
                    height: 15,
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
                          onTap: () => updateAllCountrsss(),
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.start,
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
                                sl.get<ApiData>().getAllCountryData(),
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
                                                : allCountry
                                                    .countryCode
                                                    .length)),
                                    Expanded(
                                        child: _buildcolum2(
                                            'Confirmed',
                                            (showall == false)
                                                ? 10
                                                : allCountry
                                                    .countryCode
                                                    .length)),
                                    Expanded(
                                        child: _buildcolum3(
                                            'Recovered',
                                            (showall == false)
                                                ? 10
                                                : allCountry
                                                    .countryCode
                                                    .length)),
                                    Expanded(
                                        child: _buildcolum4(
                                            'Deaths',
                                            (showall == false)
                                                ? 10
                                                : allCountry
                                                    .countryCode
                                                    .length)),
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
                  SizedBox(
                    height: 5,
                  ),
                  FlatButton(
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
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
