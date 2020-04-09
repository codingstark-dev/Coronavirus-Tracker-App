import 'package:coronatracker/Freezed/covid_freezed.dart';
import 'package:coronatracker/Service_Locator/locator.dart';
import 'package:coronatracker/constant/allConstant.dart';
import 'package:coronatracker/http/fetch_api.dart';
import 'package:coronatracker/provider/boolstates.dart';
import 'package:coronatracker/provider/getsinglereport.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:provider/provider.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget({Key key, @required this.buttonAction}) : super(key: key);

  final Function buttonAction;
  CountryReport countryReport;
  // final List countrySelect;

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  List datata = [];
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String valuess;

  ScrollController _scrollController2;
  final _scrollControllerGroup = LinkedScrollControllerGroup();

  @override
  void initState() {
    super.initState();
    _scrollController2 = _scrollControllerGroup.addAndGet();
  }

  Function mathFunc = (Match match) => '${match[1]},';

  Future updateAllCountry() async {
    // final dynamic data = await sl.get<ApiData>().getVirusData('global');
    // final dynamic pros = sl.get<BoolChecker>();
    final datas = await sl.get<ApiData>().getVirusData('global');
    final DataState boolChecker =
        Provider.of<DataState>(context, listen: false);
    // pros.lol.clear();
    boolChecker.lol.clear();
    setState(() {
      boolChecker.datachanged(datas);
    });
    boolChecker.apidatatass(0);
    boolChecker.boolChanger(false);
    // setState(() {
    //   if (data == null) {
    //     final lol = Country(totalConfirmed: 0, totalDeaths: 0, totalRecovered: 0);
    //     final dataa = lol.toJson();
    //     country = Country.fromJson(dataa);
    //   }
    //   final lol = Country(
    //       totalConfirmed: data['totalConfirmed'],
    //       totalDeaths: data['totalDeaths'],
    //       totalRecovered: data['totalRecovered']);
    //   final dataa = lol.toJson();
    //   country = Country.fromJson(dataa);
    //   print(country.totalConfirmed);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context).devicePixelRatio;
    final DataState checker = Provider.of<DataState>(context, listen: true);
    final SingleReport singleReport =
        Provider.of<SingleReport>(context, listen: true);
    return Card(
      margin: EdgeInsets.all(1),
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: (value) {
              setState(() {
                // value = valuess;
                datata = singleReport.countryReport.countryreport
                    .where((element) =>
                        element.toString().toLowerCase().contains(value))
                    .toList();
                // print(datata);
                // checker.lolee.clear();

                final List countrydatas = datata;
                // singleReport.listofcountry(countrydatas);
                widget.countryReport = CountryReport(countrydatas);
                // for (var i = 0; i < datata.length; i++) {
                // checker.datachangedss(datata);
                // checker.apidatata2(0);
                // checker.apidatata2(i);
                // }
              });
              // print(datata);
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
            color: GREY_LIGHT,
            child: ListView(
              children: [
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        singleReport.getglobaldata();
                        checker.boolChanger(false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              width: 230,
                            ),
                          ],
                        ),
                      ),
                    ),
                    (widget.countryReport == null ||
                            widget.countryReport.countryreport == 'null' ||
                            widget.countryReport.countryreport == '')
                        ? ListView.builder(
                            shrinkWrap: true,
                            controller: _scrollController2,
                            itemCount:
                                singleReport.countryReport.country.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                splashColor: Colors.amber,
                                onTap: () {
                                  // print(widget.countryCode[index]);
                                  singleReport.selectCountry(
                                    singleReport
                                        .countryReport.countryreport[index],
                                  );
                                  checker.boolChanger(false);
                                  // checker.lol.clear();
                                  // checker
                                  //     .datachanged(widget.countryCode[index]);
                                  // checker.apidatata(0);
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
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(
                                            (singleReport.countryReport
                                                                .countryCode[
                                                            index] ==
                                                        null ||
                                                    singleReport.countryReport
                                                                .countryCode[
                                                            index] ==
                                                        'null' ||
                                                    singleReport.countryReport
                                                                .countryCode[
                                                            index] ==
                                                        '')
                                                ? 'assets/h20-webp/lols.webp'
                                                : 'assets/h20-webp/${singleReport.countryReport.countryCode[index].toString().toLowerCase()}.webp',
                                            height: 10,
                                            width: 20,
                                            cacheHeight: 10,
                                            cacheWidth: 20,
                                          ),
                                        ),
                                        Text(
                                            "${singleReport.countryReport.country[index]}"
                                                .replaceAllMapped(
                                                    reg, mathFunc),
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300)),
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
                                widget.countryReport.countryreport?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                splashColor: Colors.amber,
                                onTap: () {
                                  // print(widget.countryCode[index]);

                                  singleReport.selectCountry(
                                    widget.countryReport.countryreport[index],
                                  );
                                  checker.boolChanger(false);
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
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(
                                            (widget.countryReport.countryCode[
                                                            index] ==
                                                        null ||
                                                    widget.countryReport
                                                                .countryCode[
                                                            index] ==
                                                        'null' ||
                                                    widget.countryReport
                                                                .countryCode[
                                                            index] ==
                                                        '')
                                                ? 'assets/h20-webp/lols.webp'
                                                : 'assets/h20-webp/${widget.countryReport.countryCode[index].toString().toLowerCase()}.webp',
                                            height: 10,
                                            width: 20,
                                            cacheHeight: 10,
                                            cacheWidth: 20,
                                          ),
                                        ),
                                        Text(
                                            "${widget.countryReport.country[index]}"
                                                .replaceAllMapped(
                                                    reg, mathFunc),
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300)),
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
