import 'package:coronatracker/constant/allConstant.dart';
import 'package:coronatracker/provider/boolstates.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
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
              body: Column(
                children: <Widget>[
                  SizedBox(
                    width: 370,
                    height: 140,
                    child: Card(
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
                                child: Image.asset('assets/h20-webp/us.webp'),
                              ),
                              Text(
                                "United States Overview",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "336,851",
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
                                        "+233 new cases",
                                        style: TextStyle(color: DARK_RED_LIGHT),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "17,977",
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
                                        "9,620",
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
                                        "+8 new deaths",
                                        style: TextStyle(color: DARK_GREY),
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
                ],
              ),
            );
          },
        ));
  }
}
