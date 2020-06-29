import 'package:flutter/material.dart';
import 'package:recyclomedia/images.dart';
import 'package:recyclomedia/layout.constants.dart';
import 'package:recyclomedia/widgets/eventsCard.dart';
import 'package:recyclomedia/widgets/userCard.widget.dart';
import 'package:recyclomedia/pages/events.page.dart';
import 'package:audioplayers/audio_cache.dart';

import '../fonts.dart';
import 'events.page.dart';
import 'login.page.dart';

const clicksound = "audio/click.wav";

class DashboardPage extends StatefulWidget {
  final Color color;
  double screenSize;

  DashboardPage(this.color);

  @override
  State<StatefulWidget> createState() {
    return DashboardPageState();
  }
}

class DashboardPageState extends State<DashboardPage> {
  static AudioCache player = new AudioCache();

  @override
  Widget build(BuildContext context) {
    //Viewport
    final vh = MediaQuery.of(context).size.height;

    final verticalHeader = Column(
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
          imgurl: Images.rainGIF,
          label: "Green-o-lantern",
          level: 10,
        ),
      ],
    );

    final horizontalHeader = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "WELCOME BACK!",
          style: TextStyle(
              fontFamily: Fonts.SilkScreen, fontSize: FontSize.Heading),
        ),
        GestureDetector(
          //TODO add onpress
          child: Container(
            child: Row(
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: Fonts.SilkScreen,
                      fontSize: FontSize.userCardText),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        )
      ],
    );
    final header = new Container(
      margin: EdgeInsets.only(
          left: Layout.marginTrailingLeading,
          right: Layout.marginTrailingLeading),
      padding: vh > 680
          ? EdgeInsets.only(top: 0.06 * vh)
          : EdgeInsets.only(top: 0.02 * vh),
      child: Column(
        children: [
          vh > 480 ? verticalHeader : horizontalHeader,
          Container(
            margin: EdgeInsets.only(top: Layout.contentSpacing),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Upcoming events",
                style: TextStyle(
                    fontFamily: Fonts.SilkScreen, fontSize: FontSize.Heading),
              ),
            ),
          ),
        ],
      ),
    );

    final cardContainer = Padding(
      padding: EdgeInsets.symmetric(horizontal: Layout.marginTrailingLeading),
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          children: [
            GestureDetector(
              onTap: () {
                player.play(clicksound);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => EventsPage(),
                  ),
                );
              },
              child: EventsCard("Iceberg Preservation Day",
                  "from 9.00 am onwards", Images.iceberg),
            ),
            GestureDetector(
              onTap: () {
                player.play(clicksound);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => EventsPage(),
                  ),
                );
              },
              child: EventsCard(
                  "Reforesting Camp", "from 8.30 am onwards", Images.forest),
            ),
            GestureDetector(
              onTap: () {
                player.play(clicksound);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => EventsPage(),
                  ),
                );
              },
              child: EventsCard("Preserve Medicinal Plants",
                  "from 8.30 am onwards", Images.mountain),
            ),
//            eventsCard("Beach Cleanup 2020", Images.mountain),
//            eventsCard("Akash's Gay Marriage", Images.forest),
//            eventsCard("Akash's Gay Marriage", Images.sunset),
//            eventsCard("Beach Cleanup 2020", Images.mountain),
//            eventsCard("Akash's Gay Marriage", Images.forest),
//            eventsCard("Akash's Gay Marriage", Images.sunset),

          ]),
    );

    return new Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Stack(
              children: [
                Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: header),
              ],
            ),
          ),
          Expanded(
            flex: MediaQuery.of(context).size.height > 680 ? 10 : 6,
//            flex: MediaQuery.of(context).size.height > 680 ? 4 : 8,
            child: Container(
                margin: EdgeInsets.symmetric(vertical: Layout.cardTopMargin),
                height: double.infinity,
                alignment: Alignment.center,
                child: cardContainer),
          )
        ],
      ),
    ));
  }
}
