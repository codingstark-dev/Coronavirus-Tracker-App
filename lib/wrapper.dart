import 'package:coronatracker/constant/allConstant.dart';
import 'package:coronatracker/main.dart';
import 'package:coronatracker/screen/nointernet.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'enums/connectivity_status.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
    firebasemassage();
    try {
      versionCheck(context);
    } catch (e) {
      print(e);
    }
  }

  void firebasemassage() {
    FirebaseMessaging().configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        // _showItemDialog(message);
      },
      // onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // _navigateToItemDetail(message);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ConnectivityStatus connectionStatus =
        Provider.of<ConnectivityStatus>(context);

    if (connectionStatus == ConnectivityStatus.Offline) {
      return NoInternetPage();
    } else if (connectionStatus == ConnectivityStatus.Cellular) {
      return LoadingPage();
    } else if (connectionStatus == ConnectivityStatus.WiFi) {
      return LoadingPage();
    } else {
      return Container();
    }
  }

  final playStoreLink =
      'https://play.google.com/store/apps/details?id=in.citygrow.seller';

  versionCheck(context) async {
    //Get Current installed version of app
    final PackageInfo info = await PackageInfo.fromPlatform();
    double currentVersion =
        double.parse(info.version.trim().replaceAll(".", ""));

    //Get Latest version info from firebase config
    final RemoteConfig remoteConfig = await RemoteConfig.instance;

    try {
      // Using default duration to force fetching from remote server.
      await remoteConfig.fetch(
          expiration: const Duration(seconds: 0));
      await remoteConfig.activateFetched();
      // remoteConfig.getString('force_update_current_version');
      double newVersion = double.parse(remoteConfig
          .getString('force_update_current_version')
          .trim()
          .replaceAll(".", ""));
      if (newVersion > currentVersion) {
        _showVersionDialog(context,
            remoteConfig.getString('app_download_link').toString());
      }
    } on FetchThrottledException catch (exception) {
      // Fetch throttled.
      print(exception);
    } catch (exception) {
      print(
          'Unable to fetch remote config. Cached or default values will be '
          'used');
    }
  }

  _showVersionDialog(context, linkss) async {
    await showDialog<String>(
      useRootNavigator: false,
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String title = "New Update Available!!";
        String message =
            "There is a newer version of app available please update it now. If your not going to update your app will not work!!";
        String btnLabel = "Update Now!";
        // String btnLabelCancel = "Later";

        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(15.0))),
            elevation: 0.5,
            title: Text(title),
            content: Text(message),
            scrollable: true,
            actions: <Widget>[
              RaisedButton(
                color: GREEN_COLOR,
                onPressed: () => _launchURL(linkss),
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(4.0))),
                child: Text(btnLabel),
              ),
              // FlatButton(
              //   color: Colors.deepPurple[400],
              //   child: Text(btnLabel),
              //   onPressed: () => _launchURL(playStoreLink),
              // ),
              // FlatButton(
              //   child: Text(btnLabelCancel),
              //   onPressed: () => Navigator.pop(context),
              // ),
            ],
          ),
        );
      },
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
