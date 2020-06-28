import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final Color color;

  ProfilePage(this.color);

  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
    );
  }

}