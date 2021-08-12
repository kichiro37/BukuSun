import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  const Review({required this.reviews});
  final reviews;
  @override
  Widget build(BuildContext context) {
    print('================================================================');
    print(reviews);
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
                  itemCount: reviews.length,
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
                                            reviews[index].imageAsset),
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
                                        child: Text(reviews[index].nama,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(reviews[index].bintang,
                                                style: TextStyle(fontSize: 11)),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(reviews[index].tanggal,
                                                style: TextStyle(fontSize: 10)),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 230,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(reviews[index].komentar,
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
