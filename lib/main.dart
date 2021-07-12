import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  List<Tab> myTab = [
    Tab(
      text: 'HOT',
      //icon: Icon(Icons.add_a_photo),
    ),
    Tab(
      text: 'Comedy',
    ),
    Tab(
      text: 'Horror',
    ),
    Tab(
      text: 'Romance',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BossunApp',
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
          appBar: AppBarNew(myTab: myTab),
          drawer: SafeArea(
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    height: 170,
                    color: Colors.amber,
                    child: Image.asset(
                      'img/totoro.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.coffee),
                    title: Text('Saweria'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            Center(
              child: Text('tab HOT1'),
            ),
            Center(
              child: Text('tab Comedy'),
            ),
            Center(
              child: Text('tab Horror'),
            ),
            Center(
              child: Text('Tab Romance'),
            )
          ]),
        ),
      ),
    );
  }
}

class AppBarNew extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(100);
  AppBarNew({required this.myTab});

  final List<Tab> myTab;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AppBar(
      backgroundColor: Colors.amber,
      centerTitle: true,
      title: Text('BossunApp'),
      bottom: TabBar(
        labelColor: Colors.orange,
        unselectedLabelColor: Colors.white,
        indicatorColor: Colors.orange,
        tabs: myTab,
      ),
    ));
  }
}
