import 'package:flutter/material.dart';

var myDefalutBackground = Colors.white;

var myAppBar = AppBar(
  backgroundColor: Colors.grey[900],
  title: Text('S N A P S H O T'),
  actions: <Widget>[
    IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
  ],
);

var myDrawer = Drawer(
  backgroundColor: Colors.grey[300],
  child: Column(
    children: [
      Icon(
        Icons.favorite,
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('●●君お知らせ一覧'),
      ),
      ListTile(
        leading: Icon(Icons.chat),
        title: Text('カレンダー'),
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('S E T T I N G'),
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text('L O G O U T'),
      ),
    ],
  ),
);
