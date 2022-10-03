import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_vue/model/chart.dart';
import 'package:web_vue/model/chart_title.dart';
import 'package:web_vue/page/chart_serach_page.dart';

import '../constants.dart';
import '../provider/chart_provider.dart';
import '../provider/chart_title_provider.dart';
import '../provider/event_provider.dart';
import '../util/my_box.dart';
import '../util/my_title.dart';

class tabletScaffold extends StatefulWidget {
  const tabletScaffold({Key? key}) : super(key: key);

  @override
  State<tabletScaffold> createState() => _tabletScaffoldState();
}

class _tabletScaffoldState extends State<tabletScaffold> {
  final _textTitleController = TextEditingController();
  final _textController = TextEditingController();

  List<String> messages = [];
  late Chart chart;
  late final ChartTitle chartTitle;
  final List<Chart> _charts = [];
  final List<ChartTitle> _chartTitles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final chartTitles = Provider.of<ChartTitleProvider>(context).chartTitles;
    int titleCount = chartTitles.length;
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChartSearchPage(),
                              ),
                            );
                          },
                          child: Icon(Icons.search),
                        ),
                        FloatingActionButton(
                          onPressed: () async {
                            await ChartAdd();
                          },
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                  ChartList(titleCount),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future ChartAdd() => showModalBottomSheet(
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return Container(
            color: Colors.grey[300],
            height: 220,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('タイトル: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(
                        child: TextField(
                          controller: _textTitleController,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('内容: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(
                        child: TextField(
                          controller: _textController,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(30),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(
                    Icons.done,
                    size: 20,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    var title = _textTitleController.text.trim();
                    var msg = _textTitleController.text.trim();

                    // ignore: unused_local_variable
                    final chartTitle =
                        ChartTitle(title: _textTitleController.text);
                    final chart = Chart(
                        title: _textTitleController.text,
                        content: _textController.text,
                        date: DateTime.now(),
                        authority_flg: 1);
                    _charts.add(chart);
                    _chartTitles.add(chartTitle);

                    _textTitleController.clear();
                    print(_charts[0].title);
                    final providerChart =
                        Provider.of<ChartProvider>(context, listen: false);
                    final providerChartTitle =
                        Provider.of<ChartTitleProvider>(context, listen: false);

                    providerChart.addChart(chart);
                    providerChartTitle.addChartTitle(chartTitle);
                    Navigator.pop(context, true);
                  },
                ),
              ],
            ),
          );
        });
      },
      context: context);

  Widget ChartList(int titleCount) => ListView.builder(
        shrinkWrap: true,
        itemCount: titleCount,
        itemBuilder: (BuildContext context, index) {
          final charts = Provider.of<ChartProvider>(context).charts;
          final chartTitles =
              Provider.of<ChartTitleProvider>(context).chartTitles;
          int titleIndex = index;
          return Card(
            child: Container(
              color: Colors.grey[300],
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      chartTitles[index].title,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: charts.length,
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Row(
                              children: [Text(charts[index].date.toString())],
                            ),
                            ListTile(
                              title: Text(
                                charts[index].content,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
      );
}
