import 'dart:async';
import 'dart:convert';
import 'package:bossunapp/models/api.dart';
import 'package:bossunapp/pages/photo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const Albums());

class Albums extends StatefulWidget {
  const Albums({Key? key}) : super(key: key);

  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  List<Album> parseAlbum(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Album> album = list.map((model) => Album.fromJson(model)).toList();
    return album;
  }

  Future<List<Album>> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      return compute(parseAlbum, response.body);
    } else {
      throw Exception('Request Api Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
      future: fetchAlbum(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Photos(album: snapshot.data[index]);
                    }));
                  },
                  child: Card(
                    child: Text(snapshot.data[index].title),
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    ));
  }
}
