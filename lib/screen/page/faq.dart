import 'package:coronatracker/constant/allConstant.dart';
import 'package:coronatracker/provider/boolstates.dart';
import 'package:coronatracker/screen/model/faq.dart';
import 'package:coronatracker/widget/menudropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataState>(
      builder: (context, dataState, child) => Scaffold(
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
              child:  Image.asset('assets/images/coronatracker.png'),
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
        body: Container(
          child: Column(
            children: <Widget>[
              (dataState.menuDropDowm == false)
                  ? Container()
                  : MenuDropDownTopBar(),
              Expanded(
                child: Theme(
                  data: ThemeData(accentColor: GREEN_COLOR),
                  child: ListView.builder(
                      itemCount: DataSource.questionAnswers.length,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          title: Text(
                            DataSource.questionAnswers[index]['question'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: GREEN_COLOR),
                          ),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                DataSource.questionAnswers[index]['answer'],
                                style: TextStyle(fontWeight: FontWeight.w400),
                                textAlign: TextAlign.justify,
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
