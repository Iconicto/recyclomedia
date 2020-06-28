import 'package:flutter/material.dart';
import 'package:recyclomedia/fonts.dart';
import 'package:recyclomedia/pages/donations.page.dart';
import 'package:recyclomedia/pages/home.page.dart';
import 'package:recyclomedia/pages/landing.page.dart';

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
        fontFamily: Fonts.SilkScreen,
      ),
      home: LandingPage(),
    );
  }
}
