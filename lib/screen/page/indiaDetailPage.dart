import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:coronatracker/Freezed/covid_freezed.dart';
import 'package:coronatracker/constant/allConstant.dart';
import 'package:coronatracker/provider/boolstates.dart';
import 'package:coronatracker/provider/newsfetch.dart';
import 'package:coronatracker/screen/news.dart';
import 'package:coronatracker/widget/painter.dart';

class IndiaDetailPage extends StatefulWidget {
  IndiaDetailPage({
    Key key,
    @required this.country,
  }) : super(key: key);
  final Country country;
  @override
  _IndiaDetailPageState createState() => _IndiaDetailPageState();
}

class _IndiaDetailPageState extends State<IndiaDetailPage> {
  Function mathFunc = (Match match) => '${match[1]},';
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

  // var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  @override
  void initState() {
    super.initState();
    print(widget.country);
    Provider.of<NewsFetch>(context, listen: false).getVirusData('50');
  }

  @override
  Widget build(BuildContext context) {
    NewsFetch newsFetch = Provider.of<NewsFetch>(context, listen: false);
    return ChangeNotifierProvider<DataState>(
        create: (BuildContext context) => DataState(),
        child: Consumer<DataState>(
          builder: (context, dataState, child) {
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
                            decoration: BoxDecoration(
                                border: Border.all(color: GREEN_COLOR)),
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
                    child: Image.asset('assets/logopng.png'),
                  ),
                  backgroundColor: Colors.white,
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Corona',
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
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 375,
                          height: 140,
                          child: Card(
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Image.asset(
                                            'assets/h20-webp/${widget.country.countryCode.toLowerCase()}.webp'),
                                      ),
                                      Text(
                                        '${widget.country.country.toString()} Overview',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                widget.country.totalConfirmed
                                                    .toString()
                                                    .replaceAllMapped(
                                                        reg, mathFunc),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: DARK_RED_LIGHT),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Confirmed",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: DARK_GREY),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "+${widget.country.dailyConfirmed.toString().replaceAllMapped(reg, mathFunc)} new cases",
                                                style: TextStyle(
                                                    color: DARK_RED_LIGHT),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                widget.country.totalRecovered
                                                    .toString()
                                                    .replaceAllMapped(
                                                        reg, mathFunc),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Color(0xff38a169)),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Recovered",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: DARK_GREY),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                widget.country.totalDeaths
                                                    .toString()
                                                    .replaceAllMapped(
                                                        reg, mathFunc),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: DARK_GREY),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Deaths",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: DARK_GREY),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "+${widget.country.dailyDeaths.toString().replaceAllMapped(reg, mathFunc)} new Deaths",
                                                style:
                                                    TextStyle(color: DARK_GREY),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Sparkline(
                        //   lineWidth: 10.0,
                        //   lineGradient: new LinearGradient(
                        //     begin: Alignment.topCenter,
                        //     end: Alignment.bottomCenter,
                        //     colors: [Colors.purple[800], Colors.purple[200]],
                        //   ),
                        //   data: data,
                        // ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Card(
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        height: 140,
                                        width: 170,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: CustomPaint(
                                                foregroundPainter: ProgressPainter(
                                                    circleWidth: 5,
                                                    completedPercentage:
                                                        double.parse(
                                                            widget.country.fR),
                                                    defaultCircleColor:
                                                        Colors.grey[300],
                                                    percentageCompletedCircleColor:
                                                        Color(0xffff9ab2))),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            '${double.parse(widget.country.fR).abs().toStringAsFixed(2).toString()}%',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "OF TOTAL CASES",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: Text(
                                      "Fatality Rate",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Card(
                              child: Container(
                                // decoration: BoxDecoration(
                                //     image: DecorationImage(
                                //         colorFilter:
                                //             ColorFilter.linearToSrgbGamma(),
                                //         alignment: Alignment.bottomLeft,
                                //         fit: BoxFit.cover,
                                //         image: AssetImage(
                                //           'assets/images/coronaimage.png',
                                //         ))),
                                child: Column(
                                  children: <Widget>[
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          height: 140,
                                          width: 170,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: CustomPaint(
                                                  foregroundPainter: ProgressPainter(
                                                      circleWidth: 5,
                                                      completedPercentage:
                                                          double.parse(widget
                                                              .country.pR),
                                                      defaultCircleColor:
                                                          Colors.grey[300],
                                                      percentageCompletedCircleColor:
                                                          Color(0xff4daff7))),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              '${double.parse(widget.country.pR).abs().toStringAsFixed(2).toString()}%',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "OF TOTAL CASES",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: Text(
                                        "Recovery Rate",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 150,
                            width: 400,
                            child: Card(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Colors.white, BlendMode.softLight),
                                        alignment: Alignment.centerLeft,
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/linegraph4.png',
                                        ))),
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            "Critical Cases treated in ICU",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12.0, 10, 10, 10),
                                          child: Text(
                                            widget.country.totalCritical
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 23),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12.0, 10, 10, 10),
                                            child: RichText(
                                                text: TextSpan(
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                    children: [
                                                  TextSpan(
                                                      text: (widget.country
                                                                      .totalCritical /
                                                                  widget.country
                                                                      .totalConfirmed *
                                                                  100)
                                                              .toStringAsFixed(2)
                                                              .toString() +
                                                          '% ',
                                                      style: TextStyle(
                                                          color: DARK_RED_LIGHT)),
                                                  TextSpan(
                                                      text: 'of total cases',
                                                      style: TextStyle(
                                                          color: Colors.black))
                                                ]))),
                                        // Sparkline(
                                        //   lineWidth: 10.0,
                                        //   lineGradient: new LinearGradient(
                                        //     begin: Alignment.topCenter,
                                        //     end: Alignment.bottomCenter,
                                        //     colors: [
                                        //       Colors.purple[800],
                                        //       Colors.purple[200]
                                        //     ],
                                        //   ),
                                        //   data: data,
                                        // ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 150,
                            width: 400,
                            child: Card(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Colors.white, BlendMode.softLight),
                                        alignment: Alignment.centerLeft,
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/linegraph4.png',
                                        ))),
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            "Daily Cases Receiving Treatment",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12.0, 10, 10, 10),
                                          child: Text(
                                            widget.country.activeCases.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 23),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12.0, 10, 10, 10),
                                            child: RichText(
                                                text: TextSpan(
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                    children: [
                                                  TextSpan(
                                                      text: (widget.country
                                                                      .activeCases /
                                                                  widget.country
                                                                      .totalConfirmed *
                                                                  100)
                                                              .toStringAsFixed(2)
                                                              .toString() +
                                                          '% ',
                                                      style: TextStyle(
                                                          color: DARK_RED_LIGHT)),
                                                  TextSpan(
                                                      text: 'of total cases',
                                                      style: TextStyle(
                                                          color: Colors.black))
                                                ]))),
                                        // Sparkline(
                                        //   lineWidth: 10.0,
                                        //   lineGradient: new LinearGradient(
                                        //     begin: Alignment.topCenter,
                                        //     end: Alignment.bottomCenter,
                                        //     colors: [
                                        //       Colors.purple[800],
                                        //       Colors.purple[200]
                                        //     ],
                                        //   ),
                                        //   data: data,
                                        // ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 150,
                            width: 400,
                            child: Card(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Colors.white, BlendMode.softLight),
                                        alignment: Alignment.centerLeft,
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/linegraph4.png',
                                        ))),
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            "Daily Confirmed Cases",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12.0, 10, 10, 10),
                                          child: Text(
                                             widget.country.totalConfirmedPerMillionPopulation.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 23),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12.0, 10, 10, 10),
                                            child: RichText(
                                                text: TextSpan(
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                    children: [
                                                  // TextSpan(
                                                  //     text: '0.0% ',
                                                  //     style: TextStyle(
                                                  //         color: DARK_RED_LIGHT)),
                                                  TextSpan(
                                                      text:
                                                          'Per Million Population',
                                                      style: TextStyle(
                                                          color: Colors.black))
                                                ]))),
                                        // Sparkline(
                                        //   lineWidth: 10.0,
                                        //   lineGradient: new LinearGradient(
                                        //     begin: Alignment.topCenter,
                                        //     end: Alignment.bottomCenter,
                                        //     colors: [
                                        //       Colors.purple[800],
                                        //       Colors.purple[200]
                                        //     ],
                                        //   ),
                                        //   data: data,
                                        // ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
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
                                onTap: () {
                                  newsFetch.getVirusData('50');
                                },
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
                        SizedBox(
                          height: 10,
                        ),
                        NewsSection()
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
