import 'dart:async';
import 'dart:convert';
import 'package:bossunapp/models/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Photos extends StatefulWidget {
  final album;
  const Photos({required this.album});

  @override
  _PhotosState createState() => _PhotosState(album);
}

class _PhotosState extends State<Photos> {
  var album;

  _PhotosState(album) {
    this.album = album.id;
    print(album.id);
  }

  List<Photo> parsePhoto(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Photo> photo = list.map((model) => Photo.fromJson(model)).toList();
    return photo;
  }

  Future<List<Photo>> fetchPhoto() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/photos?albumId=$album'));
    if (response.statusCode == 200) {
      return compute(parsePhoto, response.body);
    } else {
      throw Exception('Request Api Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
          child: FutureBuilder(
        future: fetchPhoto(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].title),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      )),
    );
  }
}
