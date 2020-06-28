import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  final Color color;

  EventsPage(this.color);

  @override
  State<StatefulWidget> createState() {
    return EventsPageState();
  }
}

class EventsPageState extends State<EventsPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
    );
  }

}