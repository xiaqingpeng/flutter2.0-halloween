import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              height: 120,
              width: screenWidth,
              child: Container(
                decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                child: TopTab(),
              ),
            ),
            Positioned(
              bottom: 0,
              height: 150,
              width: screenWidth * 0.7,
              child: Container(
                child: BtnConten(),
              ),
            ),
            Positioned(
              top: 0.3 * screenHeight,
              right: 0,
              height: 0.4 * screenHeight,
              width: screenWidth * 0.25,
              child: Container(
                child: getButtonList(),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              height: 0.25 * screenWidth,
              width: screenWidth * 0.25,
              child: Container(
                child: RotateAlbum(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopTab extends StatefulWidget {
  @override
  _TopTabState createState() => _TopTabState();
}

class _TopTabState extends State<TopTab> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  
  void dispose() { 
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Icon(Icons.search),
        ),
        Expanded(
          flex: 6,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: TabBar(
              indicatorColor: Colors.white,
              labelStyle: TextStyle(color: Colors.white, fontSize: 18),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 25),
              unselectedLabelStyle:
                  TextStyle(color: Colors.grey[700], fontSize: 20),
              controller: tabController,
              tabs: <Widget>[
                Text('关注'),
                Text('推荐'),
               
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Icon(Icons.live_tv),
        ),
      ],
    );
  }
}

class BtnConten extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text('@人民日报'),
            subtitle:
                Text('广东省深圳市宝安区福永街道白石厦社区横巷14号新湖公寓-广东省深圳市宝安区福永街道白石厦社区横巷14号新湖公寓'),
          ),
          Row(
            children: [
              Icon(Icons.music_note),
            ],
          )
        ],
      ),
    );
  }
}

class RotateAlbum extends StatefulWidget {
  @override
  _RotateAlbumState createState() => _RotateAlbumState();
}

class _RotateAlbumState extends State<RotateAlbum>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  var animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(controller)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            controller.forward(from: 0.0);
          }
        }),
      child: Icon(
        Icons.music_note,
        size: 30,
      ),
    );
    controller.forward(from: 0.0);
  }

  void dispose() { 
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: animation,
    );
  }
}

getButtonList() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 60,
        height: 70,
        child: Stack(
          children: [
            Container(
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3024387196,1621670548&fm=27&gp=0.jpg'),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 17.5,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      IconText(
        icon: Icon(
          Icons.favorite,
          size: 45,
          color: Colors.blueAccent,
        ),
        text: Text(
          '999w',
          style: TextStyle(color: Colors.white),
        ),
      ),
      IconText(
        icon: Icon(
          Icons.feedback,
          size: 45,
          color: Colors.blueAccent,
        ),
        text: Text(
          '999w',
          style: TextStyle(color: Colors.white),
        ),
      ),
     
    ],
  );
}

class IconText extends StatelessWidget {
  const IconText({required this.icon, required this.text});
  final Icon icon;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [icon, text],
      ),
    );
  }
}
