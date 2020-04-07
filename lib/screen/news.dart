import 'package:coronatracker/provider/newsfetch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsSection extends StatefulWidget {
  NewsSection({Key key}) : super(key: key);

  @override
  _NewsSectionState createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  @override
  Widget build(BuildContext context) {
    final NewsFetch newsFetch = Provider.of<NewsFetch>(context);
    return Container(
      height: 400,
      width: 400,
      child: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            itemCount: newsFetch?.newsData?.newsdata?.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: InkWell(
                  onTap: () {
                    launch(newsFetch?.newsData?.url[index].toString());
                  },
                  child: ListTile(
                    subtitle: Row(
                      children: <Widget>[
                        Flexible(
                          child: Text( 
                            newsFetch?.newsData?.title[index]?.toString(),
                            style: TextStyle(fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,maxLines: 2,
                          ),
                        ),
                        Text(
                          timeago
                              .format(DateTime.parse(newsFetch
                                  ?.newsData?.publishedAt[index]
                                  .toString()))
                              .toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 11),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    title: Text(
                      newsFetch.newsData.title[index].toString(),
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Image.network(
                      newsFetch?.newsData?.urlToImage[index].toString(),
                      fit: BoxFit.cover,
                      height: 60,
                      width: 60,
                    ),
                  ),
                ),
              );
            },
          ))

          // Expanded(
          //   child: Card(
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Row(
          //         children: <Widget>[
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Image.network(
          //               'https://images.prismic.io/ionicframeworkcom/535ffa1fc6a21e97cb3c7aec6d415a37ab6dea04_ionic_vs_flutter.png?auto=compress,format',
          //               fit: BoxFit.cover,
          //               height: 60,
          //               width: 60,
          //             ),
          //           ),
          //           Expanded(
          //             child: Column(
          //               children: <Widget>[
          //                 Text(
          //                   "It’s Finland on the line and they need Covid-19 testinsssssssssssssssssssssssssssssssdddddddddddddddddddddddddddddddddddddddddddddg",
          //                   style: TextStyle(fontWeight: FontWeight.w500),
          //                 ),
          //                 SizedBox(
          //                   height: 5,
          //                 ),
          //                 Flexible(
          //                   child: Text(
          //                     "It’s Finland on the line and they need Covid-19testindddddddddddddddddddddddddddddddddddddddddddddg",
          //                     style: TextStyle(
          //                         fontWeight: FontWeight.w400, fontSize: 12),
          //                     overflow: TextOverflow.ellipsis,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
