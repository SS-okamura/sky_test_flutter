import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_vue/provider/event_provider.dart';
import 'package:web_vue/responsive/desktop_scaffold.dart';
import 'package:web_vue/responsive/mobile_scaffold.dart';
import 'package:web_vue/responsive/responsive_layout.dart';
import 'package:web_vue/responsive/tablet_scaffold.dart';

void main() {
  runApp(const MyApp());
}

var userFlg = '';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
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
