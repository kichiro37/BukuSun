import 'package:bossunapp/models/data_buku.dart';
import 'package:bossunapp/pages/wishlist.dart';
import 'package:bossunapp/pages/album.dart';
// import 'package:bossunapp/models/data_account.dart';
import 'package:flutter/material.dart';
import 'package:bossunapp/pages/appbar_new.dart';
import 'package:bossunapp/pages/view_buku.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MainScreen extends StatefulWidget {
  final username;
  final name;
  final imgUrl;
  MainScreen({Key? key, required this.username, this.name, this.imgUrl})
      : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<DataBuku> detail = dataBukuList;
  final List<Tab> myTab = [
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
    return DefaultTabController(
      length: myTab.length,
      child: Scaffold(
        appBar: AppBarNew(myTab: myTab),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: Colors.amber,
          closeManually: true,
          children: [
            SpeedDialChild(
                child: Icon(Icons.apps), label: 'View Grid', onTap: () {})
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 170,
                color: Colors.amber,
                child: Image.asset(
                  'img/totoro.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                child: Text('HALLO ${widget.name}'),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Wishlist'),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return PageWishlist(
                        dataBukuList: dataBukuList, username: widget.username);
                  }));
                },
              ),
              ListTile(
                leading: Icon(Icons.coffee),
                title: Text('Saweria'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          ViewBuku(
            dataBukuList: dataBukuList,
            username: widget.username,
          ),
          Albums(),
          Center(
            child: Text('tab Horror'),
          ),
          Center(
            child: Text('Tab Romance'),
          )
        ]),
      ),
    );
  }
}
