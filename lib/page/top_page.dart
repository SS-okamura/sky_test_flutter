import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:intl/intl.dart';
import 'package:matcher/matcher.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:web_vue/constants.dart';
import 'package:web_vue/page/chat_page.dart';
import 'package:web_vue/page/task_list_page.dart';
import 'package:web_vue/responsive/desktop_scaffold.dart';
import 'package:web_vue/responsive/tablet_scaffold.dart';
import 'package:web_vue/util/my_box.dart';
import 'package:web_vue/util/my_title.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:async';
import 'package:badges/badges.dart';

class topPage extends StatefulWidget {
  const topPage({Key? key}) : super(key: key);

  @override
  State<topPage> createState() => _topPageState();
}

class _topPageState extends State<topPage> {
  List<IconData> iconList = [Icons.chat, Icons.calendar_month];
  List<String> titleList = [
    'カレンダー',
    'チャット',
    'お知らせ',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: prefer_const_constructors
        appBar: MyAppBer(titleName: 'ホーム'),
        backgroundColor: myDefalutBackground,
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: // 影のついたカードUIが作れる
                      Card(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey, //色
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(1, 1),
                          ),
                        ],
                        color: Colors.blue[500],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                                child: Row(
                              children: [
                                Text(
                                  '作業一覧',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                      color: Colors.grey[200]),
                                ),
                              ],
                            )),
                          ),
                          Card(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey, //色
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(1, 1),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              height: 60,
                              child: Column(
                                children: [
                                  Center(
                                      child: Column(
                                    children: [
                                      Text('2022/09/12'),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('予約の確認をする'),
                                      )
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey, //色
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(1, 1),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              height: 60,
                              width: double.infinity,
                              child: Text('Card'),
                            ),
                          ),
                          Card(
                            color: Colors.red[200],
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey, //色
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(1, 1),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              height: 60,
                              width: double.infinity,
                              child: Text('Card'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  children: [
                    TableRow(children: [
                      Container(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TaskListPage(),
                                    ),
                                  );
                                },
                                icon: Badge(
                                  badgeContent: Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                  child: const Icon(
                                    Icons.assignment_turned_in_outlined,
                                    color: Color(0xFF42A5F5),
                                    size: 50,
                                  ),
                                )),
                          ),
                          Text('作業一覧'),
                        ],
                      )),
                      Container(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DesktopScaffold(),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.calendar_month,
                                  color: Color(0xFF42A5F5),
                                  size: 50,
                                )),
                          ),
                          Text('カレンダー')
                        ],
                      )),
                      Container(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatPage(),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.chat,
                                  color: Color(0xFF42A5F5),
                                  size: 50,
                                )),
                          ),
                          Text('チャット')
                        ],
                      )),
                    ]),
                    TableRow(children: [
                      Container(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.content_paste,
                                  color: Color(0xFF42A5F5),
                                  size: 50,
                                )),
                          ),
                          Text('面談予約')
                        ],
                      )),
                      Container(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.dialer_sip,
                                  color: Color(0xFF42A5F5),
                                  size: 50,
                                )),
                          ),
                          Text('連絡する')
                        ],
                      )),
                      Container(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.chat,
                                  color: Color(0xFF42A5F5),
                                  size: 50,
                                )),
                          ),
                          Text('チャット')
                        ],
                      )),
                    ]),
                    TableRow(children: [
                      Container(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.assignment_turned_in_outlined,
                                  color: Color(0xFF42A5F5),
                                  size: 50,
                                )),
                          ),
                          Text('お知らせ一覧')
                        ],
                      )),
                      Container(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.calendar_month,
                                  color: Color(0xFF42A5F5),
                                  size: 50,
                                )),
                          ),
                          Text('カレンダー')
                        ],
                      )),
                      Container(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.miscellaneous_services_outlined,
                                  color: Color(0xFF42A5F5),
                                  size: 50,
                                )),
                          ),
                          Text('設定')
                        ],
                      )),
                    ])
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

// GridView.builder(
//               itemCount: 3,
//               gridDelegate:
//                   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//               itemBuilder: (context, index) {
//                 return Container(
//                     decoration: BoxDecoration(
//                         color: Colors.grey[100], border: Border.all(width: 1)),
// child: Column(
//   children: [
//     Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             iconList[index],
//             color: Color(0xFF42A5F5),
//             size: 50,
//           )),
//     ),
//     Text(titleList[index])
//   ],
// ));
//               }),
//         )
