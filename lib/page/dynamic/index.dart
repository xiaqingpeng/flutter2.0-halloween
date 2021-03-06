import 'package:flutter/material.dart';
import 'widget/url_launcher.dart';
import 'widget/state_management.dart';
import 'widget/shared_preferences.dart';

class DynamicPage extends StatefulWidget {
  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('动态'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[TabList()],
        ));
  }
}

class TabList extends StatelessWidget {
  final List navigatorList = [
    {'name': 'url_launcher', 'id': 4, 'icon': 0xe67f, 'title': 'url_launcher'},
    {'name': 'state_management', 'id': 5, 'icon': 0xe67f, 'title': '状态管理'},
    {'name': 'shared_preferences', 'id': 4, 'icon': 0xe67f, 'title': '状态存储'}
  ];

  Widget _listViewItemUi(BuildContext context, item) {
    return Column(children: <Widget>[
      Divider(
        height: 2.0,
        indent: 0.0,
        color: Colors.grey,
      ),
      ListTile(
        title: new Text(item["title"],
            style: new TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            )),
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              // ignore: missing_return
              builder: (BuildContext context) {
                switch (item['name']) {
                  case "url_launcher":
                    return UrlLauncher();
                  case "state_management":
                    return StateManagement();
                  case "shared_preferences":
                    return SharedPreferences();

                  default:
                    return UrlLauncher();
                }
              },
            ),
          );
          // Navigator.of(context).pushNamed('/mine_detail',arguments: item);
        },
        leading: new Icon(
          // item["icon"],
          IconData(item['icon'], fontFamily: 'iconfont'),
          color: Colors.black54,
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: navigatorList.map((item) {
      return _listViewItemUi(context, item);
    }).toList());
  }
}
