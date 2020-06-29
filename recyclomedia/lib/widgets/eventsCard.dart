import 'package:flutter/material.dart';

//Boarding Cards
class EventsCard extends StatelessWidget {
  final String eventName;
  final String imgurl;
  final String details;

  const EventsCard(this.eventName, this.details, this.imgurl);

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
              image: imgurl.contains('asset') ? AssetImage(imgurl) : NetworkImage(imgurl),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: Colors.black, width: 5)),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(eventName,
                style: TextStyle(
                  fontFamily: 'SilkScreen',
                  fontSize: 16,
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0, 0),
                      blurRadius: 20.0,
                      color: Colors.black,
                    ),
                    Shadow(
                      offset: Offset(0, 0),
                      blurRadius: 10.0,
                      color: Colors.black,
                    ),
                  ],
                )),
            Text(details,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SilkScreen',
                  fontSize: 12,
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0, 0),
                      blurRadius: 20.0,
                      color: Colors.black,
                    ),
                    Shadow(
                      offset: Offset(0, 0),
                      blurRadius: 10.0,
                      color: Colors.black,
                    ),
                  ],
                )),
          ],
        )));
  }
}
