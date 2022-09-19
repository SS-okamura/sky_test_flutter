import 'package:flutter/material.dart';
import 'package:web_vue/responsive/tablet_scaffold.dart';

import 'responsive/desktop_scaffold.dart';

var myDefalutBackground = Colors.white;

var _selectedValue = 'Hawaii';
var _usStates = ["業者", "生徒", "講師", "保護者", "お掃除巡回スタッフ"];
var _appColer = Colors.blue;

class MyAppBer extends StatefulWidget with PreferredSizeWidget {
  final String titleName;
  // コンストラクタ
  const MyAppBer({Key? key, required this.titleName}) : super(key: key);
  @override
  _MyAppBerState createState() => _MyAppBerState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyAppBerState extends State<MyAppBer> {
  late String titleNameState;
  @override
  void initState() {
    super.initState();

    // 受け取ったデータを状態を管理する変数に格納
    titleNameState = widget.titleName;
  }

  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleNameState),
      backgroundColor: _appColer,
      actions: <Widget>[
        PopupMenuButton<String>(
          icon: Icon(Icons.account_circle),
          initialValue: _selectedValue,
          onSelected: (String s) {
            setState(() {
              _selectedValue = s;
              if (_selectedValue == "生徒") {
                _appColer = Colors.red;
              } else if (_selectedValue == "業者") {
                _appColer = Colors.blue;
              } else if (_selectedValue == "講師") {
                _appColer = Colors.green;
              } else if (_selectedValue == "保護者") {
                _appColer = Colors.yellow;
              } else if (_selectedValue == "お掃除巡回スタッフ") {
                _appColer = Colors.grey;
              }
            });
          },
          itemBuilder: (BuildContext context) {
            return _usStates.map((String s) {
              return PopupMenuItem(
                child: Text(s),
                value: s,
              );
            }).toList();
          },
        )
      ],
    );
  }
}

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('●●君お知らせ一覧'),
          ),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.chat),
              title: Text('カレンダー'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DesktopScaffold(),
                ),
              );
            },
          ),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.chat),
              title: Text('生徒検索'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const tabletScaffold(),
                ),
              );
            },
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
  }
}
