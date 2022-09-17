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
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefalutBackground,
      drawer: myDrawer,
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 4,
            child: SizedBox(
              width: double.infinity,
              child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return MYBOX();
                  }),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey[700],
                      height: 80,
                    ),
                  );
                })),
          )
        ],
      ),
    );
  }
}
