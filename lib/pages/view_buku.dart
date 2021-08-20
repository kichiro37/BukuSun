import 'package:flutter/material.dart';
import 'package:bossunapp/pages/detail_buku.dart';
import 'package:bossunapp/models/data_buku.dart';
import 'package:bossunapp/widgets/buku.dart';

class ViewBuku extends StatefulWidget {
  final dataBukuList;
  final viewMode;
  final name;
  final imgUrl;
  const ViewBuku(
      {required this.dataBukuList, this.viewMode = 0, this.name, this.imgUrl});

  @override
  _ViewBukuState createState() => _ViewBukuState();
}

class _ViewBukuState extends State<ViewBuku> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return widget.viewMode == 1
        ? bukuVertical()
        : widget.viewMode == 2
            ? bukuHorizontal()
            : bukuGrid(_width);
  }

  Widget bukuHorizontal() {
    return ListView.builder(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemCount: dataBukuList.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    final DataBuku detail = dataBukuList[index];
                    return DetailBuku(
                      detail: detail,
                    );
                  }));
                },
                child: Card(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 150,
                    height: 250,
                    color: Colors.amber,
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.all(10),
                            width: 150,
                            height: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0)),
                              child: Image.asset(
                                dataBukuList[index].imageAsset,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Text(dataBukuList[index].judul,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis),
                        )
                      ],
                    ),
                  ),
                )),
              )
            ],
          );
        });
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
                name: widget.name,
                imgUrl: widget.imgUrl,
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
