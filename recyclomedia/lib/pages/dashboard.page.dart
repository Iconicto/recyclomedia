import 'package:flutter/material.dart';
import 'package:recyclomedia/layout.constants.dart';
import 'package:recyclomedia/widgets/eventsCard.dart';
import 'package:recyclomedia/widgets/userCard.widget.dart';

import '../fonts.dart';

class DashboardPage extends StatefulWidget {
  final Color color;

  DashboardPage(this.color);

  @override
  State<StatefulWidget> createState() {
    return DashboardPageState();
  }
}

class DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    //Viewport
    final vh = MediaQuery.of(context).size.height;

    final header = new Container(
      margin: EdgeInsets.only(
          left: Layout.marginTrailingLeading,
          right: Layout.marginTrailingLeading),
      padding: EdgeInsets.only(top: 0.06 * vh),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "WELCOME BACK!",
              style: TextStyle(
                  fontFamily: Fonts.SilkScreen, fontSize: FontSize.Heading),
            ),
          ),
          UserCard(
            userName: "Akassharjun Shanmugarajah",
            imgurl: "assets/eventsbg.png",
            label: "Green-o-lantern",
            level: 10,
          )
        ],
      ),
    );

    final cardContainer = Container(
        child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            children: [
          eventsCard("Beach Cleanup 2020", "assets/eventbg1.jpg"),
          eventsCard("Akash's Gay Marriage", "assets/eventbg2.jpg"),
          eventsCard("Akash's Gay Marriage", "assets/eventbg2.jpg"),
          eventsCard("Akash's Gay Marriage", "assets/eventbg2.jpg"),
          eventsCard("Akash's Gay Marriage", "assets/eventbg2.jpg"),
          eventsCard("Akash's Gay Marriage", "assets/eventbg2.jpg"),
          eventsCard("Akash's Gay Marriage", "assets/eventbg2.jpg"),
          eventsCard("Akash's Gay Marriage", "assets/eventbg2.jpg"),
          eventsCard("Akash's Gay Marriage", "assets/eventbg2.jpg"),
          eventsCard("Akash's Gay Marriage", "assets/eventbg2.jpg"),
          eventsCard("Akash's Gay Marriage", "assets/eventbg2.jpg"),
          eventsCard("Akash's Gay Marriage", "assets/eventbg2.jpg"),
          eventsCard("Akash's Gay Marriage", "assets/eventbg2.jpg"),
        ]));

    final eventsContainer = Container(
      margin: EdgeInsets.fromLTRB(
          Layout.marginTrailingLeading,
          Layout.contentSpacing,
          Layout.marginTrailingLeading,
          Layout.contentSpacing),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Upcoming events",
              style: TextStyle(
                  fontFamily: Fonts.SilkScreen, fontSize: FontSize.Heading),
            ),
          ),
          cardContainer
        ],
      ),
    );

    return new Scaffold(
      body: SafeArea(
        child: Container(
            child: ListView(
          children: <Widget>[
            header,
            eventsContainer,
          ],
        )),
      ),
    );
  }
}
