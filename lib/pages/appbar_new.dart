import 'package:flutter/material.dart';

class AppBarNew extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(100);
  AppBarNew({required this.myTab});

  final List<Tab> myTab;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AppBar(
      backgroundColor: Colors.amber,
      centerTitle: true,
      title: Text('BossunApp'),
      bottom: TabBar(
        labelColor: Colors.orange,
        unselectedLabelColor: Colors.white,
        indicatorColor: Colors.orange,
        tabs: myTab,
      ),
    ));
  }
}
