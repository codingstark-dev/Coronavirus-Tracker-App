import 'package:coronatracker/main.dart';
import 'package:coronatracker/wrapper.dart';
import 'package:flutter/material.dart';

class LoadingPAgee extends StatefulWidget {
  LoadingPAgee({Key key}) : super(key: key);

  @override
  _LoadingPAgeeState createState() => _LoadingPAgeeState();
}

class _LoadingPAgeeState extends State<LoadingPAgee> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // navigationTopage();
  }

  // void navigationTopage() {
  //   Future.delayed(Duration(seconds: 5));
  //   Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //           builder: (BuildContext context) => Wrapper()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff301f43),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Image.asset('assets/coronagif.gif'),
              ),
            ),
            Expanded(
              child: Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              )),
            )
          ],
        ),
      ),
    );
  }
}
