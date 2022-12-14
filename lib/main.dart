import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_vue/provider/chart_provider.dart';
import 'package:web_vue/provider/chart_title_provider.dart';
import 'package:web_vue/responsive/desktop_scaffold.dart';
import 'package:web_vue/responsive/mobile_scaffold.dart';
import 'package:web_vue/responsive/responsive_layout.dart';
import 'package:web_vue/responsive/tablet_scaffold.dart';

import 'provider/event_provider.dart';
import 'provider/user_provider.dart';

void main() {
  runApp(const MyApp());
}

var userFlg = '';
final selectedValue = '業者';
final usStates = ["業者", "生徒", "講師", "保護者", "お掃除巡回スタッフ"];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EventProvider>(
          create: (context) => EventProvider(),
        ),
        ChangeNotifierProvider<ChartProvider>(
          create: (context) => ChartProvider(),
        ),
        ChangeNotifierProvider<ChartTitleProvider>(
          create: (context) => ChartTitleProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ResponsiveLayout(
            desktopScaffold: DesktopScaffold(),
            mobileScaffold: mobileScaffold(),
            tabletScaffold: tabletScaffold(),
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ResponsiveLayout(
          desktopScaffold: DesktopScaffold(),
          mobileScaffold: mobileScaffold(),
          tabletScaffold: tabletScaffold(),
        ));
  }
}
