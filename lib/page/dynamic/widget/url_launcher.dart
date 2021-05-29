import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/platform.dart';

class UrlLauncher extends StatefulWidget {
  @override
  _UrlLauncherState createState() => _UrlLauncherState();
}

class _UrlLauncherState extends State<UrlLauncher> {
  final phone = '17304472875';
  final url = 'https://www.baidu.com/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('url_launcher'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            render()
          ],
        ),
      ),
    );
  }

  render() {
    if (PlatformUtils.isWeb) {
      return ElevatedButton(
        onPressed: () => makeBrowser(url),
        child: Text('浏览器打开'),
      );
    }
    if (PlatformUtils.isAndroid) {
      return ElevatedButton(
        onPressed: () => makePhone('tel:$phone'),
        child: Text('打电话'),
      );
    }
    if (PlatformUtils.isIOS) {
      return ElevatedButton(
        onPressed: () => makePhone('tel:$phone'),
        child: Text('打电话'),
      );
    }
  }

  Future<void> makePhone(String phone) async {
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }

  Future<void> makeBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
