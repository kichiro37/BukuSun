import 'package:bossunapp/pages/detail_buku.dart';
import 'package:flutter/material.dart';
import 'package:bossunapp/pages/appbar_new.dart';
import 'package:bossunapp/models/data_buku.dart';

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
    double _width = MediaQuery.of(context).size.width;
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
          GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: dataBukuList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _width < 400 ? 2 : 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2 / 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              final DataBuku detail = dataBukuList[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return DetailBuku(
                      detail: detail,
                    );
                  }));
                },
                child: Stack(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Image.asset(dataBukuList[index].imageAsset,
                            fit: BoxFit.cover),
                      ),
                    ],
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 300,
                            color: Colors.black.withOpacity(0.4),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              dataBukuList[index].judul,
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ]),
              );
            },
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
    );
  }
}
