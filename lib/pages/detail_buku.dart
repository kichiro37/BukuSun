import 'package:flutter/material.dart';
import 'package:bossunapp/model/data_buku.dart';
import 'package:expandable_text/expandable_text.dart';

class DetailBuku extends StatefulWidget {
  final DataBuku detail;
  DetailBuku({required this.detail});

  @override
  _DetailBukuState createState() => _DetailBukuState();
}

class _DetailBukuState extends State<DetailBuku> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 125,
                      padding: EdgeInsets.all(10),
                      child: Image.asset(widget.detail.imageAsset)),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, right: 10),
                        child: Text(
                          widget.detail.judul,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              widget.detail.author,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, left: 5),
                            child: Text(
                              widget.detail.tanggal,
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              widget.detail.publisher,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 10,
                                    color: Colors.lightBlue,
                                  ),
                                  Text(
                                    "Add to Wishlist",
                                    style: TextStyle(
                                        color: Colors.lightBlue, fontSize: 10),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Center(
                              child: RaisedButton(
                                onPressed: () {
                                  print("beli");
                                },
                                child: Text(
                                  "Beli",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.lightBlue,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExpandableText(
                            widget.detail.deskripsi,
                            expandText: 'show more',
                            collapseText: 'show less',
                            maxLines: 5,
                            linkColor: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                indent: 10,
                endIndent: 10,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
