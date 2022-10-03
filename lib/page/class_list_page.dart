import 'package:flutter/material.dart';
import 'package:web_vue/constants.dart';
import 'package:web_vue/page/chat_page.dart';
import 'package:web_vue/responsive/desktop_scaffold.dart';
import 'package:web_vue/responsive/tablet_scaffold.dart';

class ClassListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBer(titleName: '生徒一覧'),
      drawer: MyDrawer(),
      body: Container(
        color: Colors.grey[200],
        child: ListView(
          children: List.generate(
            100,
            (int index) {
              return _listItem(index, context);
            },
          ),
        ),
      ),
    );
  }

  Widget _listItem(int index, BuildContext context) {
    return ListTile(
      selectedColor: Colors.grey[200],
      contentPadding: EdgeInsets.all(10.0),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => tabletScaffold(),
          ),
        );
      },
      leading: CircleAvatar(
        backgroundImage: AssetImage("images/user.jpeg"),
      ),
      title: Text(
        "テスト太郎",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "住所などの情報",
                overflow: TextOverflow.clip,
                maxLines: 3,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(),
                      ),
                    );
                  },
                  icon: Icon(Icons.comment)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DesktopScaffold(),
                      ),
                    );
                  },
                  icon: Icon(Icons.calendar_month)),
              Icon(Icons.share),
            ],
          )
        ],
      ),
    );
  }
}
