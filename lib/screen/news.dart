import 'package:flutter/material.dart';

class NewsSection extends StatefulWidget {
  NewsSection({Key key}) : super(key: key);

  @override
  _NewsSectionState createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 150,
        width: 400,
        child: Card(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://images.prismic.io/ionicframeworkcom/535ffa1fc6a21e97cb3c7aec6d415a37ab6dea04_ionic_vs_flutter.png?auto=compress,format',
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "It’s Finland on the line and they need Covid-19 testinsssssssssssssssssssssssssssssssdddddddddddddddddddddddddddddddddddddddddddddg",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Flexible(
                        child: Text(
                          "It’s Finland on the line and they need Covid-19testindddddddddddddddddddddddddddddddddddddddddddddg",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
