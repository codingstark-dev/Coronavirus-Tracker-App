import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BodyContainer extends StatefulWidget {
  BodyContainer({Key key}) : super(key: key);

  @override
  _BodyContainerState createState() => _BodyContainerState();
}

class _BodyContainerState extends State<BodyContainer> {
  @override
  Widget build(BuildContext context) {
    return Align(
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
              height: 295,
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
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 120,
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
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
                                      '715,486',
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
                                            color: Color(0xffe53e3e),
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
                                      '150,883',
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
                                            color: Color(0xff38a169),
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
                                      '33,655',
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
                                            color: Color(0xff718096),
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
                    ), SizedBox(height: 30,),
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
          // Container(
          //   decoration: BoxDecoration(
          //       border: Border.all(color: Color(0xff108885))),
          //       child: SizedBox(width: 50,height: 300,),
          // ),
        ],
      ),
    );
  }
}
