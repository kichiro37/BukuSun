import 'package:flutter/material.dart';
import 'package:bossunapp/models/data_buku.dart';
import 'package:bossunapp/widgets/read_more.dart';
import 'package:bossunapp/widgets/review.dart';
import 'package:bossunapp/widgets/buku.dart';

class DetailBuku extends StatefulWidget {
  final DataBuku detail;
  final username;
  DetailBuku({required this.detail, this.username});

  @override
  _DetailBukuState createState() => _DetailBukuState(detail);
}

class _DetailBukuState extends State<DetailBuku> {
  var reviews;
  _DetailBukuState(detail) {
    reviews = reviewBukuList(detail.id);
    // print(reviews);
  }

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
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Buku(
                detail: widget.detail,
                username: widget.username,
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
              Review(
                  detail: widget.detail,
                  reviews: reviews,
                  username: widget.username),
            ],
          ),
        ),
      )),
    );
  }
}
