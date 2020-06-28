import 'package:flutter/material.dart';


//Boarding Cards
class eventsCard extends StatelessWidget {
  final String eventName;
  final String imgurl;

  const eventsCard(this.eventName, this.imgurl);

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
          image: AssetImage(imgurl),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: Colors.black, width: 5)
      ),
      child: Center(
        child: Text(
          eventName,
          style: TextStyle(
            fontFamily: 'SilkScreen',
            color: Colors.white
            )
          )
      )
    );
  }
}

