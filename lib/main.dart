import 'package:bossunapp/pages/main_screen.dart';
import 'package:bossunapp/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool islogged = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BossunApp',
      debugShowCheckedModeBanner: false,
      home: islogged ? MainScreen() : Login(),
    );
  }
}
