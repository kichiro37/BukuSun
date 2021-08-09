import 'package:flutter/material.dart';

class Buku extends StatelessWidget {
  final detail;
  Buku({required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 125,
            padding: EdgeInsets.all(10),
            child: Image.asset(detail.imageAsset)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, right: 10),
              child: Text(
                detail.judul,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    detail.author,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 5),
                  child: Text(
                    detail.tanggal,
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
                    detail.publisher,
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
                          style:
                              TextStyle(color: Colors.lightBlue, fontSize: 10),
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
    );
  }
}
