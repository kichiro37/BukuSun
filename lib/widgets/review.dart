import 'package:flutter/material.dart';
import 'package:bossunapp/models/data_buku.dart';

class Review extends StatefulWidget {
  final DataBuku detail;
  final reviews;
  final username;
  const Review({required this.detail, this.username, this.reviews});

  @override
  _ReviewState createState() => _ReviewState(detail, reviews);
}

class _ReviewState extends State<Review> {
  bool isReview = false;
  String komentar = '';
  String bintang = '';
  String id = 'review6';
  var reviewsLokal;

  _ReviewState(detail, reviews) {
    reviewsLokal = reviews;
    refreshReview(detail.id);
    print('==============');
    print(reviewsLokal);
    print('==============');
  }

  void refreshReview(idBuku) {
    isReview = false;
    reviewsLokal = reviewBukuList(idBuku);
    reviewList.forEach((review) {
      if (review.idBuku == idBuku) {
        isReview = true;
      }
    });
  }

  void doKomentar(id, idBuku, username, bintang, komentar) {
    reviewList.add(ReviewBuku(
        id: id,
        idBuku: idBuku,
        username: widget.username,
        bintang: bintang,
        komentar: komentar));
    // print(widget.reviews);
    refreshReview(idBuku);
  }

  @override
  Widget build(BuildContext context) {
    // print('================================================================');
    // print('name');
    // print('================================================================');
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text("REVIEWS"),
                      ),
                      Container(
                        child: Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side:
                                    BorderSide(width: 1, color: Colors.black54),
                                primary: Colors.white,
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Text('Berhasil Wishlist'),
                                          content: SingleChildScrollView(
                                              child: Column(
                                            children: [
                                              TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    komentar = value;
                                                  });
                                                },
                                                style: TextStyle(
                                                    color: Colors.amber),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.only(top: 14),
                                                  hintText: 'Komentar',
                                                ),
                                              ),
                                              TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    bintang = value;
                                                  });
                                                },
                                                style: TextStyle(
                                                    color: Colors.amber),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.only(top: 14),
                                                  hintText: 'Bintang',
                                                ),
                                              ),
                                            ],
                                          )),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    doKomentar(
                                                        id,
                                                        widget.detail.id,
                                                        widget.username,
                                                        bintang,
                                                        komentar);
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Text('Submit'))
                                          ],
                                        ));
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.edit,
                                      size: 15, color: Colors.black54),
                                  Text(
                                    " Write a Review",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
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
        isReview
            ? buildReview()
            : Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text('tidak ada komentar'),
                  ),
                ],
              )
      ],
    );
  }

  Widget buildReview() {
    return Row(
      children: [
        SizedBox(
            height: 300,
            width: 300,
            child: ListView.builder(
              itemCount: reviewsLokal.length,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 17.0,
                                  child: ClipOval(
                                    child: Image.asset(
                                        widget.reviews[index]['imgUrl']),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(reviewsLokal[index]['name'],
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                            reviewsLokal[index]['bintang'],
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
                                    padding:
                                        EdgeInsets.only(left: 10, bottom: 10),
                                    child: Text(reviewsLokal[index]['komentar'],
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
    );
  }
}
