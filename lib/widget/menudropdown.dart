import 'package:coronatracker/constant/allConstant.dart';
import 'package:coronatracker/constant/routung_constant.dart';
import 'package:coronatracker/provider/boolstates.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuDropDownTopBar extends StatefulWidget {
  MenuDropDownTopBar({Key key}) : super(key: key);

  @override
  _MenuDropDownTopBarState createState() => _MenuDropDownTopBarState();
}

class _MenuDropDownTopBarState extends State<MenuDropDownTopBar> {
  @override
  Widget build(BuildContext context) {
    final DataState dataState = Provider.of<DataState>(context);

    return Container(
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black38, blurRadius: 0.05, offset: Offset(0.0, 0.75))
      ], color: Colors.white),
      // color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          SizedBox(
              height: 31,
              child: FlatButton(
                  onPressed: () {
                    dataState.menuDropDowm == false
                        ? dataState.boolChanger2(true)
                        : dataState.boolChanger2(false);
                    // Navigator.pushNamed(context, CovidHome);
                    Navigator.pushReplacementNamed(context, CovidHome);
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(
                        color: GREEN_COLOR, fontWeight: FontWeight.w700),
                  ))),
          // SizedBox(
          //     height: 31,
          //     child: FlatButton(
          //         onPressed: () {
          //           Fluttertoast.showToast(
          //               msg: 'This Feature Will Come Soon And Stay Tune!');
          //         },
          //         child: Text(
          //           "Travel Alert",
          //           style: TextStyle(
          //               color: GREEN_COLOR, fontWeight: FontWeight.w700),
          //         ))),
          SizedBox(
              height: 31,
              child: FlatButton(
                  onPressed: () {
                    launch(
                        'https://www.who.int/health-topics/coronavirus#tab=tab_1');
                  },
                  child: Text(
                    "What is COVID-19",
                    style: TextStyle(
                        color: GREEN_COLOR, fontWeight: FontWeight.w700),
                  ))),
          SizedBox(
              height: 31,
              child: FlatButton(
                  onPressed: () {
                    launch(
                        'https://www.who.int/health-topics/coronavirus#tab=tab_2');
                  },
                  child: Text(
                    "Prevention",
                    style: TextStyle(
                        color: GREEN_COLOR, fontWeight: FontWeight.w700),
                  ))),
          SizedBox(
              height: 31,
              child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Privacypolicy);
                  },
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(
                        color: GREEN_COLOR, fontWeight: FontWeight.w700),
                  ))),
          SizedBox(
              height: 31,
              child: FlatButton(
                  hoverColor: DARK_RED_LIGHT,
                  focusColor: DARK_RED_LIGHT,
                  onPressed: () {
                    Navigator.pushNamed(context, AboutMEE);
                  },
                  child: Text(
                    "About Developer",
                    style: TextStyle(
                        color: GREEN_COLOR, fontWeight: FontWeight.w700),
                  ))),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
