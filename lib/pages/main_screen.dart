import 'package:bossunapp/models/data_buku.dart';
import 'package:flutter/material.dart';
import 'package:bossunapp/pages/appbar_new.dart';
import 'package:bossunapp/pages/view_buku.dart';

class MainScreen extends StatelessWidget {
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.keyboard_arrow_up),
        ),
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
          ViewBuku(dataBukuList: dataBukuList),
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
    );
  }
}
