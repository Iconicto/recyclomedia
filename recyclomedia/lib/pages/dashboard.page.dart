import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final Color color;

  DashboardPage(this.color);

  @override
  State<StatefulWidget> createState() {
    return DashboardPageState();
  }
}

class DashboardPageState extends State<DashboardPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
    );
  }

}