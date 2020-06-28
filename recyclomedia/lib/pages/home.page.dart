import 'package:flutter/material.dart';
import 'package:recyclomedia/assets/fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Text(
          "Hellos there",
          style: TextStyle(fontFamily: Fonts.SilkScreen, fontSize: 100),
        ),
      ),
    ));
  }
}
