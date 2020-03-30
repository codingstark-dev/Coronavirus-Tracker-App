import 'package:coronatracker/Freezed/covid_freezed.dart';
import 'package:flag/flag.dart';
import 'package:coronatracker/Service_Locator/locator.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:coronatracker/http/fetch_api.dart';

class BodyContainer extends StatefulWidget {
  BodyContainer({Key key}) : super(key: key);

  @override
  _BodyContainerState createState() => _BodyContainerState();
}

class _BodyContainerState extends State<BodyContainer> {
  final _scrollControllerGroup = LinkedScrollControllerGroup();
  ScrollController _scrollController1;
  ScrollController _scrollController2;
  ScrollController _scrollController3;
  ScrollController _scrollController4;
  final _pageController = PageController();
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';
  Country country;
  AllCountry allCountry;
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

  void updateAllCountry() async {
    final dynamic data = await sl.get<ApiData>().getVirusData();
    setState(() {
      if (data == null) {
        final lol = Country(confirmed: 0, death: 0, recover: 0);
        final dataa = lol.toJson();
        country = Country.fromJson(dataa);
      }
      final lol = Country(
          confirmed: data['totalConfirmed'],
          death: data['totalDeaths'],
          recover: data['totalRecovered']);
      final dataa = lol.toJson();
      country = Country.fromJson(dataa);
      print(country.confirmed);
    });
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
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                width: 340,
                height: 330,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 0),
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
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                animation: "Untitled"),
                          ),
                          Text(
                            'LIVE',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 145,
                          ),
                          FlatButton.icon(
                              hoverColor: Colors.blueAccent,
                              onPressed: () => updateAllCountry(),
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
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                        child: GestureDetector(
                          onTap: () => updateAllCountrsss(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 36,
                              width: 400,
                              color: Color(0xffedf2f7),
                              child: Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FaIcon(
                                    FontAwesomeIcons.globe,
                                    color: Colors.black87,
                                    size: 20,
                                  ),
                                  Text('Global',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight:
                                              FontWeight.bold)),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Card(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.center,
                                      color: Color(0xfffff5f5),
                                      height: 50,
                                      width: 110,
                                      child: Text(
                                        '${country?.confirmed}'
                                                .replaceAllMapped(
                                                    reg, mathFunc) ??
                                            '0',
                                        style: TextStyle(
                                            color: Color(0xffe53e3e),
                                            fontSize: 18,
                                            fontWeight:
                                                FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        color: Color(0xfffed7d7),
                                        height: 40,
                                        width: 110,
                                        child: Text(
                                          'Confirmed',
                                          style: TextStyle(
                                              color:
                                                  Color(0xffe53e3e),
                                              fontSize: 14,
                                              fontWeight:
                                                  FontWeight.w500),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Card(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.center,
                                      color: Color(0xfff0fff4),
                                      height: 50,
                                      width: 120,
                                      child: Text(
                                        '${country?.recover}'
                                                .replaceAllMapped(
                                                    reg, mathFunc) ??
                                            '0',
                                        style: TextStyle(
                                            color: Color(0xff38a169),
                                            fontSize: 18,
                                            fontWeight:
                                                FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        color: Color(0xffc6f6d5),
                                        height: 40,
                                        width: 120,
                                        child: Text(
                                          'Recovered',
                                          style: TextStyle(
                                              color:
                                                  Color(0xff38a169),
                                              fontSize: 14,
                                              fontWeight:
                                                  FontWeight.w500),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Card(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.center,
                                      color: Color(0xfffedf2f7),
                                      height: 50,
                                      width: 120,
                                      child: Text(
                                        '${country?.death}'
                                                .replaceAllMapped(
                                                    reg, mathFunc) ??
                                            '0',
                                        style: TextStyle(
                                            color: Color(0xff718096),
                                            fontSize: 18,
                                            fontWeight:
                                                FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        color: Color(0xffe2e8f0),
                                        height: 40,
                                        width: 120,
                                        child: Text(
                                          'Deaths',
                                          style: TextStyle(
                                              color:
                                                  Color(0xff718096),
                                              fontSize: 14,
                                              fontWeight:
                                                  FontWeight.w500),
                                        ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                          child: Text(
                        'More Details',
                        style: TextStyle(
                            color: Color(0xff4299e1),
                            fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 400,
                height: 130,
                child: Image.asset(
                  'assets/images/survey_mobile.png',
                  alignment: Alignment.topCenter,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.contain,
                ),
              ),
            ),
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
                    color: Color(0xff108885),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'COUNTRIES AFFECTED',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff108885),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5.0,0,0,20),
                          child: IconButton(
                              icon: Icon(
                                Icons.refresh,
                                color: Color(0xff108885),
                              ),
                              onPressed: () => updateAllCountrsss()),
                        ),
                      ],
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
                width: 350,
                height: 400,
                child: PageView(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: _buildcolum('Country',
                                allCountry.confirmed.length)),
                        Expanded(
                            child: _buildcolum2('Confirmed',
                                allCountry.confirmed.length)),
                        Expanded(
                            child: _buildcolum3('Recovered',
                                allCountry.confirmed.length)),
                        Expanded(
                            child: _buildcolum4('Deaths',
                                allCountry.confirmed.length)),
                        // Expanded(child: _buildcolum('dddd', 10)),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
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
              style: TextStyle(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
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
                  color: Color(0xffedf2f7),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Flags.getFullFlag(
                                "${allCountry.countryCode[index]['countryCode']}",
                                15,
                                15),
                          ),
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
              style: TextStyle(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
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
                  "${allCountry.confirmed[index]['totalConfirmed']}"
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
              style: TextStyle(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
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
              style: TextStyle(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
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
                  "${allCountry.death[index]['totalDeaths']}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
