import 'package:flutter/material.dart';
import 'package:recyclomedia/pages/home.page.dart';
import 'package:recyclomedia/pages/eventsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: eventsPage(),
    );
  }
}
