import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final Color color;

  SettingsPage(this.color);

  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
    );
  }

}