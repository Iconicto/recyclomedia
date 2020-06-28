import 'package:flutter/material.dart';
import 'package:recyclomedia/images.dart';
import 'package:recyclomedia/layout.constants.dart';
import 'package:recyclomedia/widgets/eventsCard.dart';
import 'package:recyclomedia/widgets/userCard.widget.dart';

import '../fonts.dart';
import 'login.page.dart';

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
  @override
  Widget build(BuildContext context) {
    //Viewport
    final vh = MediaQuery.of(context).size.height;

    final verticalHeader = Column(
      children: [Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "WELCOME BACK!",
          style: TextStyle(
              fontFamily: Fonts.SilkScreen, fontSize: FontSize.Heading),
        ),
      ),
        UserCard(
          userName: "Akassharjun Shanmugarajah",
          imgurl: "lib/assets/images/eventsbg.png",
          label: "Green-o-lantern",
          level: 10,
        ),],
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
                  style: TextStyle(color: Colors.grey,
                      fontFamily: Fonts.SilkScreen, fontSize: FontSize.userCardText),
                ),
                Icon(Icons.chevron_right, color: Colors.grey,)
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

      padding: vh > 680 ? EdgeInsets.only(top: 0.06 * vh) : EdgeInsets.only(top: 0.02 * vh),
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
            ),),
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
            eventsCard("Beach Cleanup 2020", "from 8.30 am onwards", Images.mountain),
//            eventsCard("Akash's Gay Marriage", Images.forest),
//            eventsCard("Akash's Gay Marriage", Images.sunset),
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
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: header
                  ),
                ],
              ),
            ),
            Expanded(
              flex: MediaQuery.of(context).size.height > 680 ? 4 : 6,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: Layout.cardTopMargin),
                height: double.infinity,
                alignment: Alignment.center,
                child: cardContainer
              ),
            )
          ],
        ),
        ));
  }
}
