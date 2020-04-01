import 'package:coronatracker/provider/boolstates.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:provider/provider.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget(
      {Key key,
      @required this.countryCode,
      @required this.countrySelect,
      @required this.buttonAction})
      : super(key: key);
  final List countryCode;
  final List countrySelect;
  final Function buttonAction;
  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  final _scrollControllerGroup = LinkedScrollControllerGroup();
  String valuess;
  ScrollController _scrollController2;
  Function mathFunc = (Match match) => '${match[1]},';
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  List datata = [];
  @override
  void initState() {
    super.initState();
    _scrollController2 = _scrollControllerGroup.addAndGet();
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).devicePixelRatio;
    final BoolChecker checker =
        Provider.of<BoolChecker>(context, listen: true);

    return Card(
      margin: EdgeInsets.all(1),
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: (value) {
              setState(() {
                // value = valuess;
                datata = widget.countrySelect
                    .where((element) => element['country']
                        .toString()
                        .toLowerCase()
                        .contains(value))
                    .toList();

                // for (var i = 0; i < datata.length; i++) {
                  checker.datachangedss(datata);
                  // checker.apidatata2(i);
                // }
              });
              print(datata);
            },
            decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w500),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(5),
                hintText: 'Search country',
                alignLabelWithHint: true),
          ),
          Container(
            height: 700 / query,
            // width: 400,
            color: Color(0xffedf2f7),
            child: ListView(
              children: [
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: FaIcon(
                              FontAwesomeIcons.globe,
                              color: Colors.black54,
                              size: 20,
                            ),
                          ),
                          Text('Global',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300)),
                          SizedBox(
                            width: 200,
                          ),
                        ],
                      ),
                    ),
                    (checker.lolee.isEmpty)
                        ? ListView.builder(
                            shrinkWrap: true,
                            controller: _scrollController2,
                            itemCount: widget.countryCode.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return InkWell(
                                splashColor: Colors.amber,
                                onTap: () {
                                  // print(widget.countryCode[index]);

                                  checker.boolChanger(false);
                                  checker.lol.clear();
                                  checker.datachanged(
                                      widget.countryCode[index]);
                                  checker.apidatata(0);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.all(
                                                  5.0),
                                          child: Image.asset(
                                            'assets/w2560-webp/${widget.countryCode[index]['countryCode'].toString().toLowerCase()}.webp',
                                            height: 10,
                                            width: 20,
                                            cacheHeight: 10,
                                            cacheWidth: 20,
                                          ),
                                        ),
                                        Text(
                                            "${widget.countrySelect[index]['country']}"
                                                .replaceAllMapped(
                                                    reg, mathFunc),
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16,
                                                fontWeight:
                                                    FontWeight.w300)),
                                        SizedBox(
                                          width: 250 / query,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            controller: _scrollController2,
                            itemCount:
                                checker.lolee[0].length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return InkWell(
                                splashColor: Colors.amber,
                                onTap: () {
                                  // print(widget.countryCode[index]);

                                  checker.boolChanger(false);
                                  checker.lol.clear();
                                  checker.datachanged(
                                      widget.countryCode[index]);
                                  checker.apidatata(0);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.all(
                                                  5.0),
                                          child: Image.asset(
                                            'assets/w2560-webp/${checker.lolee[0][index]['countryCode'].toLowerCase()}.webp',
                                            height: 10,
                                            width: 20,
                                            cacheHeight: 10,
                                            cacheWidth: 20,
                                          ),
                                        ),
                                        Text(
                                            "${checker.lolee[0][index]['country']}"
                                                .replaceAllMapped(
                                                    reg, mathFunc),
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16,
                                                fontWeight:
                                                    FontWeight.w300)),
                                        SizedBox(
                                          width: 250 / query,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}