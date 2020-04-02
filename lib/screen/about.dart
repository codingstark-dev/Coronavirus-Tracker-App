import 'package:coronatracker/constant/allConstant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1000,
        color: GREEN_COLOR,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 55,
              child: ClipOval(
                child: Image.network(
                  'https://www.huzaifamustafa.com/assets/img/me.jpeg',
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Divider(),
            Text(
              "Stay Connect With Us",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    icon: Icon(FontAwesomeIcons.github),
                    onPressed: () {
                      launch("https://github.com/code-stark");
                    }),
                IconButton(
                    icon: Icon(FontAwesomeIcons.youtube),
                    onPressed: () {
                      launch(
                          "https://www.youtube.com/channel/UCDsh5gPkhqFBtYrC7CHEYpg/");
                    }),
                IconButton(
                    icon: Icon(FontAwesomeIcons.instagram),
                    onPressed: () {
                      launch(
                          "https://www.instagram.com/codingstark/");
                    }),
                IconButton(
                    icon: Icon(FontAwesomeIcons.twitter),
                    onPressed: () {
                      launch("https://twitter.com/Himanshuly");
                    }),
                IconButton(
                    icon: Icon(FontAwesomeIcons.whatsapp),
                    onPressed: () {
                      launch("https://wa.me/8149963853?text=hi");
                    }),
                IconButton(
                    icon: Icon(Icons.email),
                    onPressed: () {
                      launch("mailto:mhimanshu.338@gmail.com");
                    }),
              ],
            ),
            Divider(),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(text: "Hey, fellows, it's "),
                    TextSpan(
                        text: "Himanshu Maurya",
                        style: TextStyle(
                            color: DARK_RED_LIGHT,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            " is here! passionate programmer! 👨‍💻")
                  ], style: TextStyle(fontSize: 16))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                            "So let's begin I was suffering browser news about"),
                    TextSpan(
                        text: " COVID-19",
                        style: TextStyle(
                            color: DARK_RED_LIGHT,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            " and that I have seen the news that showing a boy who made a website that gaining  12 million views since it launched that's boy name is"),
                    TextSpan(
                        text: " Avi Schiffmann",
                        style: TextStyle(
                            color: DARK_RED_LIGHT,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            " then I also got some interest in this field then I took the "),
                    TextSpan(
                        text: "coronatracker.com",
                        style: TextStyle(
                            color: DARK_RED_LIGHT,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            " really awesome site I never saw that type site then I clone the site and integrate my own logic it's hard to make same reusable components but still some parts are done and some parts are pending. If you want source code of this it's will available at my GitHub account "),
                    TextSpan(
                        text: "\n#StayAtHomeStaySafe",
                        style: TextStyle(
                            color: DARK_RED_LIGHT,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: " #KeepCoding",
                        style: TextStyle(
                            color: DARK_RED_LIGHT,
                            fontWeight: FontWeight.bold)),
                  ], style: TextStyle(fontSize: 16))),
            )
          ],
        ),
      ),
    );
  }
}
