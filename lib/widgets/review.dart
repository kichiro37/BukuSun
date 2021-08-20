import 'package:flutter/material.dart';
import 'package:bossunapp/models/data_buku.dart';

class Review extends StatefulWidget {
  final DataBuku detail;
  final reviews;
  final name;
  final imgUrl;
  const Review({required this.detail, this.reviews, this.name, this.imgUrl});

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  String komentar = '';
  String bintang = '';
  String id = 'review6';
  //String idBuku = '';

  void doKomentar(id, idBuku, name, bintang, imgUrl, komentar) {
    reviewList.add(ReviewBuku(
        id: id,
        idBuku: idBuku,
        nama: name,
        bintang: bintang,
        imageAsset: imgUrl,
        komentar: komentar));
    print(widget.reviews);
  }

  @override
  Widget build(BuildContext context) {
    print('================================================================');
    print(widget.reviews);
    print('================================================================');
    return Column(
      children: [
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
                    child: Text("REVIEWS"),
                  ),
                  Container(
                      child: Column(
                    children: [
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            komentar = value;
                          });
                        },
                        style: TextStyle(color: Colors.amber),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 14),
                          hintText: 'Komentar',
                        ),
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            bintang = value;
                          });
                        },
                        style: TextStyle(color: Colors.amber),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 14),
                          hintText: 'Bintang',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, right: 10),
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.lightBlue,
                            ),
                            onPressed: () {
                              doKomentar(id, widget.detail.id, widget.name,
                                  bintang, widget.imgUrl, komentar);
                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
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
            SizedBox(
                height: 300,
                width: 300,
                child: ListView.builder(
                  itemCount: widget.reviews.length,
                  itemBuilder: (context, index) {
                    return Container(
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
                                        child: Image.asset(
                                            widget.reviews[index].imageAsset),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(widget.reviews[index].nama,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                                widget.reviews[index].bintang,
                                                style: TextStyle(fontSize: 11)),
                                          ),
                                          // Container(
                                          //   padding: EdgeInsets.only(left: 5),
                                          //   child: Text(
                                          //       widget.reviews[index].tanggal,
                                          //       style: TextStyle(fontSize: 10)),
                                          // ),
                                        ],
                                      ),
                                      Container(
                                        width: 230,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                            widget.reviews[index].komentar,
                                            style: TextStyle(fontSize: 10)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ))
          ],
        )
      ],
    );
  }
}
