import 'package:flutter/material.dart';


//Boarding Cards
class eventsCard extends StatelessWidget {
  final String eventName;

  const eventsCard(this.eventName);

  @override
  Widget build(BuildContext context) {

    //Viewport
    final vh = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width;

    return new Container(
      height: 84.0,
      width: vw,
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/eventbg1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
    );
  }
}

