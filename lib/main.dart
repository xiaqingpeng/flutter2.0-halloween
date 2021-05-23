import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'page/home/index.dart';
import 'page/car/index.dart';
import 'page/category/index.dart';
import 'page/mine/index.dart';

import 'page/dynamic/index.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 案列',
      debugShowCheckedModeBanner: false, // 去除debugger
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        
      ),
      home: IndexPage(),
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
