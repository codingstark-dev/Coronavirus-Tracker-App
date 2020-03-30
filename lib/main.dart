import 'package:coronatracker/Service_Locator/locator.dart';
import 'package:coronatracker/screen/body.dart';
import 'package:flutter/material.dart';

void main() {
  serviceLocator();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoadingPage(),
  ));
}

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
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
                        color: Color(0xffedf2f7),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 5,
                            ),
                            Text('EN',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff108885),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xff108885),
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
                        border: Border.all(color: Color(0xff108885))),
                    child: IconButton(
                        color: Color(0xff108885),
                        icon: Icon(Icons.menu),
                        onPressed: () {}),
                  ),
                ),
              ),
            ),
          ],
          leading: Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Image.network(
                'https://www.coronatracker.com/_nuxt/img/262cfac.png'),
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
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))
            ])),
          ),
          elevation: 1.5,
        ),
      ),
      body: BodyContainer(),
    );
  }
}
