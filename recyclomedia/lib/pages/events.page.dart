import 'package:flutter/material.dart';
import 'package:recyclomedia/fonts.dart';
import 'package:recyclomedia/images.dart';
import 'package:recyclomedia/layout.constants.dart';
import '../widgets/eventsCard.dart';
import 'login.page.dart';

class EventsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final pageHeader = new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Events",
            style: TextStyle(
              fontFamily: Fonts.SilkScreen,
              fontWeight: FontWeight.w700,
              color: Colors.white
            ),
            textScaleFactor: 2,
          ),
          Text(
            "Discover the events near you...",
            style: TextStyle(
              fontFamily: Fonts.SilkScreen,
              //fontWeight: FontWeight.w700,
              color: Colors.white
            ),
            textScaleFactor: 1,
          )
        ]
      )
    );

    final cardContainer = Container(
      margin: EdgeInsets.only(left: Layout.marginTrailingLeading, right: Layout.marginTrailingLeading),
      child: ListView(
      shrinkWrap: true,
      children: [
        eventsCard("Beach Cleanup 2020", Images.mountain),
        eventsCard("Akash's Gay Marriage", Images.forest),
        eventsCard("Akash's Gay Marriage", Images.forest),
        eventsCard("Akash's Gay Marriage", Images.forest),
        eventsCard("Akash's Gay Marriage", Images.forest),
        eventsCard("Akash's Gay Marriage", Images.forest),
        eventsCard("Akash's Gay Marriage", Images.forest),
        eventsCard("Akash's Gay Marriage", Images.forest),
      ]
    )
    );

    return new Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.red,
                  child: Image.asset(
                    Images.sunset,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 65,
                  left: 25,
                  child: pageHeader
                )
              ],
            ),
          ),
          Expanded(
            flex: MediaQuery.of(context).size.height > 680 ? 2 : 1,
            child: Container(
              alignment: Alignment.center,
                child: cardContainer
            ),
          )
        ],
      ),
    );
  }
}