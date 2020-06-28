import 'package:flutter/material.dart';
import '../widgets/eventsCard.dart';
import 'package:dio/dio.dart';

class EventsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {

  void getHttp() async {
  try {
    Response response = await Dio().get("https://recyclomedia.iconicto.com/api/events/");
    print(response);
  } catch (e) {
    print(e);
  }
}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //Viewport
    final vh = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width;

    final pageHeader = new Container(
      padding: EdgeInsets.only(left: 0.05*vw, top: 0.06*vh),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/eventsbg.png"),
          fit: BoxFit.cover,
        ),
      ),
      height: 0.25*vh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Events",
            style: TextStyle(
              fontFamily: 'SilkScreen',
              fontWeight: FontWeight.w700,
              color: Colors.white
            ),
            textScaleFactor: 2,
          ),
          Text(
            "Discover the events near you...",
            style: TextStyle(
              fontFamily: 'SilkScreen',
              //fontWeight: FontWeight.w700,
              color: Colors.white
            ),
            textScaleFactor: 1,
          )
        ]
      )
    );

    final cardContainer = Container(
      margin: EdgeInsets.only(left: 18.0, right: 18.0),
      child: ListView(
      shrinkWrap: true,
      children: [
        eventsCard("Beach Cleanup 2020", "assets/eventbg1.jpg"),
        eventsCard("Akash's Gay Marriage", "assets/eventbg2.jpg")
      ]
    )
    );

    return new Scaffold(
      body: SafeArea(
        child: Container(
            child: ListView(
              children: <Widget>[
                pageHeader,
                cardContainer
              ],
            )),
      ),
    );
  }
}