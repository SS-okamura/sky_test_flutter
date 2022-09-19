import 'package:flutter/material.dart';

import '../constants.dart';
import '../util/my_box.dart';
import '../util/my_title.dart';

class tabletScaffold extends StatefulWidget {
  const tabletScaffold({Key? key}) : super(key: key);

  @override
  State<tabletScaffold> createState() => _tabletScaffoldState();
}

class _tabletScaffoldState extends State<tabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: 2, // タブの数
      child: Scaffold(
        appBar: AppBar(
          title: const Text('test 太郎君'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: '詳細情報'),
              Tab(text: 'カルテ'),
            ],
          ),
        ),
        drawer: MyDrawer(),
        body: TabBarView(
          children: <Widget>[
            Center(
              // ignore: sized_box_for_whitespace
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      foregroundColor: Colors.black,
                      backgroundImage: AssetImage("images/user.jpeg"),
                    ),
                    Text('test 太郎'),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
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
                            color: Colors.grey[100],
                          ),
                          child: Table(
                            border: TableBorder.all(),
                            children: [
                              TableRow(children: [
                                Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(child: Text('生年月日')),
                                    ),
                                    color: Colors.grey[300]),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('2005/09/01')),
                                  ),
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                )
                              ]),
                              TableRow(children: [
                                Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(child: Text('保護者名')),
                                    ),
                                    color: Colors.grey[300]),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('TEST')),
                                  ),
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                )
                              ]),
                              TableRow(children: [
                                Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(child: Text('保有資格')),
                                    ),
                                    color: Colors.grey[300]),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Column(
                                      children: [
                                        Text('英検３級'),
                                      ],
                                    )),
                                  ),
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                )
                              ])
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Container(child: new Text('')),
                                  content: Container(
                                    height: 200,
                                    width: 400,
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              '年月日',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[Text('')],
                                        ),
                                        Row(
                                          children: [
                                            OutlinedButton(
                                                // （2） ボタンを押した時に入力できるようにする
                                                onPressed: () {},
                                                child: Text("日付選択")),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    // ignore: unnecessary_new
                                    new ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: new Text('検索')),
                                    new ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: new Text('close'))
                                  ],
                                );
                              });
                        },
                        child: Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Card(
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
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        children: [
                          Text('~~~について'),
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
                                      Row(
                                        children: [
                                          Text('2022/09/12'),
                                          Text('　英語講師')
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('内容を理解できていない'),
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
                        ],
                      ),
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Card(
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
                        color: Colors.grey[200],
                      ),
                      child: Column(
                        children: [
                          Text('~~~について'),
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
                                      Row(
                                        children: [
                                          Text('2022/09/12'),
                                          Text('　英語講師')
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('内容を理解できていない'),
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
                        ],
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
