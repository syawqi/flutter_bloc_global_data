import 'package:blocstate/screen/first.dart';
import 'package:blocstate/screen/second.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        "/" : (context) => FirstScreen(),
        "/second" : (context) => SecondScreen(),
      },
    );
  }
}