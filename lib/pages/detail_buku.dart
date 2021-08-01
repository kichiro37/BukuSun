import 'package:flutter/material.dart';
import 'package:bossunapp/models/data_buku.dart';
import 'package:bossunapp/widgets/read_more.dart';
import 'package:bossunapp/widgets/review.dart';

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
                          ReadMore(text: widget.detail.deskripsi),
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
              Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text("Ulasan"),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "4.6",
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "★★★★",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ))
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
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 17.0,
                                    child: ClipOval(
                                      child: Image.asset('img/depan.jpg'),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("Devanu Irfan",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("★",
                                          style: TextStyle(fontSize: 11)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("Kabur ada pp mikey",
                                          style: TextStyle(fontSize: 10)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  child: CircleAvatar(
                                    radius: 17.0,
                                    child: ClipOval(
                                      child: Image.asset('img/git.png'),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("Meow",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("★★★★",
                                          style: TextStyle(fontSize: 11)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("Maikyy! Tendangan Nuklir!",
                                          style: TextStyle(fontSize: 10)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  child: CircleAvatar(
                                    radius: 17.0,
                                    child: ClipOval(
                                      child: Image.asset('img/andre.jpg'),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("Aditya Andre",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("★★★★★",
                                          style: TextStyle(fontSize: 11)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                          "Kawai Senju wangy wangy wangy",
                                          style: TextStyle(fontSize: 10)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  child: CircleAvatar(
                                    radius: 17.0,
                                    child: ClipOval(
                                      child: Image.asset('img/pdi.png'),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("Banteng Ngamux",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("★★★★",
                                          style: TextStyle(fontSize: 11)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                          "Pen potong rambut kaya Draken-kun",
                                          style: TextStyle(fontSize: 10)),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
