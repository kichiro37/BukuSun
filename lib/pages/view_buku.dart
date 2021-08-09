import 'package:flutter/material.dart';
import 'package:bossunapp/pages/detail_buku.dart';
import 'package:bossunapp/models/data_buku.dart';
import 'package:bossunapp/widgets/buku.dart';

class ViewBuku extends StatefulWidget {
  final dataBukuList;
  final viewMode;
  ViewBuku({required this.dataBukuList, this.viewMode = 0});

  @override
  _ViewBukuState createState() => _ViewBukuState();
}

class _ViewBukuState extends State<ViewBuku> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return widget.viewMode == 1 ? bukuGrid(_width) : bukuHorizontal();
  }

  Widget bukuHorizontal() {
    return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: dataBukuList.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    color: Colors.amber,
                    margin: EdgeInsets.all(15),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          final DataBuku detail = dataBukuList[index];
                          return DetailBuku(
                            detail: detail,
                          );
                        }));
                      },
                      child: Container(
                          padding: EdgeInsets.only(top: 10),
                          height: 150,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Expanded(
                                      child: Container(
                                    height: 200,
                                    child: Image.asset(
                                      dataBukuList[index].imageAsset,
                                    ),
                                  )),
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      width: 110,
                                      child: Text(dataBukuList[index].judul,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis))
                                ],
                              )
                            ],
                          )),
                    ),
                  )
                ],
              );
            }));
  }

  Widget bukuVertical() {
    return ListView.builder(
        itemCount: dataBukuList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return DetailBuku(
                  detail: dataBukuList[index],
                );
              }));
            },
            child: Buku(detail: dataBukuList[index]),
          );
        });
  }

  Widget bukuGrid(_width) {
    return GridView.builder(
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
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
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
    );
  }
}
