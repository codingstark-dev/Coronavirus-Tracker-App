import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronatracker/constant/allConstant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: 1000,
          color: DARK_PURPLE,
          child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('Contributors').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List constributers = snapshot.data.documents;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 55,
                      child: ClipOval(
                        child: Image.network(
                          'https://i.pinimg.com/280x280_RS/6f/a3/f0/6fa3f0aab168cf13d062f9df566c6c3c.jpg',
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.github,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              launch("https://github.com/code-stark");
                            }),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.youtube,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              launch(
                                  "https://www.youtube.com/channel/UCDsh5gPkhqFBtYrC7CHEYpg/");
                            }),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.instagram,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              launch("https://www.instagram.com/codingstark/");
                            }),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.twitter,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              launch("https://twitter.com/Himanshuly");
                            }),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              launch(
                                  "https://api.whatsapp.com/send?phone=918149963853&text=hi&source=&data=&app_absent=");
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
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
                                text: " is here! passionate programmer! 👨‍💻")
                          ], style: TextStyle(fontSize: 16))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                    text:
                                        "So let's begin I was surfing browser news about"),
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
                                    text: " #GoCorona",
                                    style: TextStyle(
                                        color: DARK_RED_LIGHT,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: " #KeepCoding",
                                    style: TextStyle(
                                        color: DARK_RED_LIGHT,
                                        fontWeight: FontWeight.bold)),
                              ], style: TextStyle(fontSize: 16))),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              launch("https://vishwajeetkakade.me/");
                            },
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(text: "Special Thanks To "),
                                  TextSpan(
                                      text: " Vishwajeet Kakade",
                                      style: TextStyle(
                                          color: DARK_RED_LIGHT,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text:
                                          " For Publishing My App To Playstore "),
                                ], style: TextStyle(fontSize: 16))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: GREY_LIGHT,
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "App Contributors",
                                    style: TextStyle(
                                        color: DARK_RED_LIGHT,
                                        fontWeight: FontWeight.bold)),
                              ], style: TextStyle(fontSize: 16))),
                          Divider(
                            color: GREY_LIGHT,
                          ),
                          for (var i = 0; i < constributers.length; i++)
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                            " •  ${constributers[i]['name']}"),
                                  ], style: TextStyle(fontSize: 16))),
                            ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
