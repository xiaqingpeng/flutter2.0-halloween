import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'page/home/index.dart';
import 'page/car/index.dart';
import 'page/category/index.dart';
import 'page/mine/index.dart';
import 'page/dynamic/index.dart';
import 'package:provider/provider.dart';
import './model/counter.dart';
import 'model/color_them_provider.dart';
import './page/mine/widget/shared_preferences.dart';
import './page/dynamic/widget/state_management.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>.value(value: Counter()),
        ChangeNotifierProvider<ColorThemeProvider>.value(
            value: ColorThemeProvider())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final routes = {
    '/shared_preferences': (BuildContext context) => new SharedPreferences(),
    '/url_launcher': (BuildContext context) => new DynamicPage(),
    '/state_management': (BuildContext context) => new StateManagement(),
  };
  @override
  Widget build(BuildContext context) {
    Color color = Provider.of<ColorThemeProvider>(context).color;
    print(color);

    return ChangeNotifierProvider(
      create: (context) => ColorThemeProvider(),
      child: Consumer<ColorThemeProvider>(
          builder: (context, colorThemeProvider, child) {
        print(colorThemeProvider.color);
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false, // 去除debugger
          theme: ThemeData(
            primarySwatch: colorThemeProvider.color,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              foregroundColor: colorThemeProvider.color,
            ),
          ),
          home: IndexPage(),
        );
      }),
    );
  }
}

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State with WidgetsBindingObserver {
  var bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
    BottomNavigationBarItem(icon: Icon(Icons.dynamic_feed), label: '动态'),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), label: '购物车'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: '我的'),
  ];
  var tabBodies = [
    HomePage(),
    CategoryPage(),
    DynamicPage(),
    CarPage(),
    MinePage()
  ];
  int currentIndex = 0;
  var currentpage;
  @override
  void initState() {
    currentpage = tabBodies[currentIndex];
    super.initState();

    // 注册观察者
    // WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    // 注销观察者
    //WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  PageController _pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            // currentpage = tabBodies[currentIndex];
            // _pageController.jumpToPage(index);
            _pageController.animateToPage(currentIndex,
                duration: Duration(microseconds: 200), curve: Curves.easeInOut);
          });
        },
      ),
      // body: currentpage,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: PageView.builder(
          itemBuilder: (BuildContext context, int index) {
            return tabBodies[index];
          },
          controller: _pageController,
          itemCount: tabBodies.length,
          onPageChanged: (int index) {
            print('$index');
            setState(() {
              currentIndex = index;
            });
          },
        ),
        // child: PageView(
        //   controller: _pageController,
        //   physics: NeverScrollableScrollPhysics(),
        //   children: tabBodies,
        // ),
      ),
    );
  }
}
