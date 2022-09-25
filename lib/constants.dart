import 'package:flutter/material.dart';
import 'package:web_vue/page/chat_page.dart';
import 'package:web_vue/responsive/tablet_scaffold.dart';

import 'responsive/desktop_scaffold.dart';

var myDefalutBackground = Colors.white;

var _selectedValue = '業者';
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
    if (_selectedValue == "生徒") {
      return Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            ListTile(
              title: Text('●●君お知らせ一覧'),
            ),
            ListTile(
              title: Text('勉強の指示'),
            ),
            GestureDetector(
              child: ListTile(
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
                title: Text('チャット'),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('お休み連絡'),
            ),
            ListTile(
              title: Text('振替'),
            ),
            ListTile(
              title: Text('講習会・単科購入'),
            ),
            ListTile(
              title: Text('成績管理＆報告'),
            ),
            ListTile(
              title: Text('面談'),
            ),
            ListTile(
              title: Text('イベント申請'),
            ),
            ListTile(
              title: Text('FS割引紹介メール'),
            ),
            ListTile(
              title: Text('ポイントシステム'),
            ),
            ListTile(
              title: Text('友人・いとこ・兄妹などの「つながり」マップ機能'),
            ),
            ListTile(
              title: Text('自動リマインダー機能'),
            ),
          ],
        ),
      );
    } else if (_selectedValue == "業者") {
      return Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            ListTile(
              title: Text('お知らせ一覧'),
            ),
            GestureDetector(
              child: ListTile(
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
                title: Text('チャット'),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: ListTile(
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
              title: Text('代理店・業者登録'),
            ),
            ListTile(
              title: Text('契約申込'),
            ),
            ListTile(
              title: Text('契約申込'),
            ),
            ListTile(
              title: Text('備品発注・物販'),
            ),
            ListTile(
              title: Text('代理店カルテ＆伝言メモ'),
            ),
            ListTile(
              title: Text('売上マージン計算書'),
            ),
            ListTile(
              title: Text('請求確認＆修正＆承認依頼'),
            ),
            ListTile(
              title: Text('清算'),
            ),
          ],
        ),
      );
    } else if (_selectedValue == "保護者") {
      return Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text('お知らせ一覧'),
              ),
              GestureDetector(
                child: ListTile(
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
                  title: Text('チャット'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('仮登録'),
              ),
              ListTile(
                title: Text('本登録'),
              ),
              ListTile(
                title: Text('子どもの登録・変更'),
              ),
              ListTile(
                title: Text('伝言板'),
              ),
              ListTile(
                title: Text('一括お休み連絡'),
              ),
              ListTile(
                title: Text('一括遅刻連絡'),
              ),
              ListTile(
                title: Text('休・退会・復会'),
              ),
              ListTile(
                title: Text('FS会員・検定会員など'),
              ),
              ListTile(
                title: Text('クラス変更'),
              ),
              ListTile(
                title: Text('面談'),
              ),
              ListTile(
                title: Text('イベント申請'),
              ),
              ListTile(
                title: Text('授業申請'),
              ),
              ListTile(
                title: Text('請求書Web表示'),
              ),
              ListTile(
                title: Text('FS割引申請＆紹介メール'),
              ),
              ListTile(
                title: Text('掲示板'),
              ),
              ListTile(
                title: Text('個人情報の変更'),
              ),
              ListTile(
                title: Text('時間割確認'),
              ),
              ListTile(
                title: Text('成績管理'),
              ),
              ListTile(
                title: Text('検定合格メール'),
              ),
              ListTile(
                title: Text('教材購入'),
              ),
              ListTile(
                title: Text('アンケート回答'),
              ),
              ListTile(
                title: Text('ポイント交換'),
              ),
              ListTile(
                title: Text('家庭の教育方針'),
              ),
              ListTile(
                title: Text('この講師はイヤ'),
              ),
              ListTile(
                title: Text('BK登録登録'),
              ),
              ListTile(
                title: Text('社員登録'),
              ),
              ListTile(
                title: Text('授業中緊急連絡'),
              ),
              ListTile(
                title: Text('HPジャンプ'),
              ),
              ListTile(
                title: Text('GPS'),
              ),
              ListTile(
                title: Text('コマの消化'),
              ),
              ListTile(
                title: Text('請求書確認'),
              ),
              ListTile(
                title: Text('清算'),
              ),
              ListTile(
                title: Text('繋がりマップ'),
              ),
              ListTile(
                title: Text('自動リマインダー'),
              ),
            ],
          ),
        ),
      );
    } else if (_selectedValue == "講師") {
      return Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text('お知らせ一覧'),
              ),
              GestureDetector(
                child: ListTile(
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
                  title: Text('チャット'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('生徒の出欠管理'),
              ),
              GestureDetector(
                child: ListTile(
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
                title: Text('勉強の指示'),
              ),
              ListTile(
                title: Text('面談設定'),
              ),
              ListTile(
                title: Text('伝言板'),
              ),
              ListTile(
                title: Text('勤務管理'),
              ),
              ListTile(
                title: Text('仕事クラス申請'),
              ),
              ListTile(
                title: Text('クラス申請'),
              ),
              ListTile(
                title: Text('お休み申請'),
              ),
              ListTile(
                title: Text('備品の発注'),
              ),
              ListTile(
                title: Text('スケジュール報告'),
              ),
              ListTile(
                title: Text('講師の出欠管理'),
              ),
              ListTile(
                title: Text('支払い確認'),
              ),
              ListTile(
                title: Text('R)	塾生が何時までの授業を受けるのか把握できる機能'),
              ),
              ListTile(
                title: Text('保護者からの連絡'),
              ),
              ListTile(
                title: Text('保護者への急ぎの連絡ボタン'),
              ),
              ListTile(
                title: Text('自分の自由時間の販売'),
              ),
            ],
          ),
        ),
      );
    } else if (_selectedValue == 'お掃除巡回スタッフ') {
      return Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              ListTile(
                title: Text('打刻'),
              ),
              ListTile(
                title: Text('スケジュール登録'),
              ),
              ListTile(
                title: Text('請求確認＆修正＆承認依頼'),
              ),
              ListTile(
                title: Text('お知らせ'),
              ),
              GestureDetector(
                child: ListTile(
                  title: Text('チャット'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    } else {
      return Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              ListTile(
                title: Text('お知らせ一覧'),
              ),
              GestureDetector(
                child: ListTile(
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
              GestureDetector(
                child: ListTile(
                  title: Text('チャット'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('代理店・業者登録'),
              ),
              ListTile(
                title: Text('契約申込'),
              ),
              ListTile(
                title: Text('契約申込'),
              ),
              ListTile(
                title: Text('備品発注・物販'),
              ),
              ListTile(
                title: Text('代理店カルテ＆伝言メモ'),
              ),
              ListTile(
                title: Text('売上マージン計算書'),
              ),
              ListTile(
                title: Text('請求確認＆修正＆承認依頼'),
              ),
              ListTile(
                title: Text('清算'),
              ),
            ],
          ),
        ),
      );
    }
  }
}
