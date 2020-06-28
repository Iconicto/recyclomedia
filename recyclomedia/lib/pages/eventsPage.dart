import 'package:flutter/material.dart';
import '../widgets/eventsCard.dart';

class eventsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _eventsPageState();
}

class _eventsPageState extends State<eventsPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.only(left: 18.0, right: 18.0),
            child: ListView(
              children: <Widget>[
                eventsCard("Beach Cleanup 2020", "assets/eventbg1.jpg"),
                eventsCard("Akash's Gay Marriage", "assets/eventbg2.jpg")
              ],
            )),
      ),
    );
  }
}