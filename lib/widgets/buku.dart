import 'package:flutter/material.dart';
import 'package:bossunapp/models/data_wishlist.dart';

class Buku extends StatefulWidget {
  final detail;
  final username;
  Buku({required this.detail, this.username});

  @override
  _BukuState createState() => _BukuState(username, detail);
}

class _BukuState extends State<Buku> {
  _BukuState(username, detail) {
    var isFound = false;
    dataWishlist.forEach((wish) {
      if (wish.username == username && wish.idBuku == detail.id) isFound = true;
    });
    if (!isFound) {
      isWishlist = false;
    }
  }

  bool isWishlist = true;
  void doWishlist(username, idBuku) {
    dataWishlist.add(Wishlist(username: username, idBuku: idBuku));
    dataWishlist.forEach((wish) {
      print('=================');
      print(wish.username);
      print(wish.idBuku);
      print('=================');
    });
    isWishlist = true;
  }

  void doRemoveWishlist(username, idBuku) {
    dataWishlist.removeWhere(
        (wish) => wish.username == username && wish.idBuku == idBuku);
    // dataWishlist.remove(Wishlist(username: username, idBuku: idBuku));
    dataWishlist.forEach((wish) {
      print('=================');
      print(wish.username);
      print(wish.idBuku);
      print('=================');
    });
    isWishlist = false;
  }

  @override
  Widget build(BuildContext context) {
    // print(
    //     '==============================BUKU==================================');
    // print(username);
    // print('================================================================');

    return Row(
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                isWishlist == true
                    ? Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    doRemoveWishlist(
                                        widget.username, widget.detail.id);
                                  });
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: Text(
                                                'Berhasil Remove Wishlist'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  },
                                                  child: Text('OK'))
                                            ],
                                          ));
                                },
                                child: Text(
                                  'remove wishlist',
                                  style: TextStyle(fontSize: 10),
                                ))
                          ],
                        ))
                    : Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    doWishlist(
                                        widget.username, widget.detail.id);
                                  });
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: Text('Berhasil Wishlist'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  },
                                                  child: Text('OK'))
                                            ],
                                          ));
                                },
                                child: Text(
                                  '+ Add to Wishlist',
                                  style: TextStyle(fontSize: 10),
                                ))
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue,
                      ),
                      onPressed: () {
                        print("beli");
                      },
                      child: Text(
                        "Beli",
                        style: TextStyle(color: Colors.white),
                      ),
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
