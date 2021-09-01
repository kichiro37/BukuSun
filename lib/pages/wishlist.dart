import 'package:bossunapp/models/data_buku.dart';
import 'package:bossunapp/pages/detail_buku.dart';
import 'package:flutter/material.dart';
import 'package:bossunapp/models/data_wishlist.dart';

class PageWishlist extends StatefulWidget {
  final dataBukuList;
  final username;
  const PageWishlist({required this.dataBukuList, this.username});

  @override
  _PageWishlistState createState() =>
      _PageWishlistState(username, dataBukuList);
}

class _PageWishlistState extends State<PageWishlist> {
  var idBuku = [];
  var detail = [];
  _PageWishlistState(username, dataBukuList) {
    dataWishlist.forEach((wish) {
      if (wish.username == username) idBuku.add(wish.idBuku);
    });

    idBuku.forEach((buku) {
      dataBukuList.forEach((book) {
        if (buku == book.id) detail.add(book);
      });
    });

    print(idBuku);
    print('==================');
    detail.forEach((book) {
      print(book.id);
      print(book.judul);
    });
    print('==================');
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Wishlist"),
          backgroundColor: Colors.amber,
          centerTitle: true,
        ),
        body: GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: detail.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _width < 400 ? 2 : 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 2 / 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    final DataBuku detul = detail[index];
                    return DetailBuku(
                      detail: detul,
                      username: widget.username,
                    );
                  }));
                },
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(detail[index].imageAsset,
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
                                detail[index].judul,
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
