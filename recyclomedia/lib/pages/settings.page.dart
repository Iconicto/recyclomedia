import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:recyclomedia/images.dart';
import 'package:recyclomedia/pages/donations.page.dart';
import 'package:recyclomedia/pages/team.page.dart';
import 'package:recyclomedia/pages/landing.page.dart';
import 'package:recyclomedia/widgets/hero_banner.widget.dart';

const clicksound = "audio/click.wav";

class SettingsPage extends StatefulWidget {
  SettingsPage();

  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  static AudioCache player = new AudioCache();

  Widget _buildHeroBannerContent() {
    return Positioned(
      bottom: MediaQuery.of(context).viewPadding.top < 0 ? 65 : 20,
      left: 25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "THIS IS",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "SETTINGS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeroBanner(
          imageURI: Images.cityGIF,
          child: _buildHeroBannerContent(),
        ),
        Expanded(
          flex: MediaQuery.of(context).size.height > 680 ? 1 : 2,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Divider(
                      color: Colors.transparent,
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        player.play(clicksound);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => AboutUsPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/aboutus.png'),
                            Text(
                              "OUR TEAM",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 5),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        player.play(clicksound);
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => DonationsPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/donate.png'),
                            Text(
                              "DONATE",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 5),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        player.play(clicksound);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => LandingPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/level.png'),
                            Text(
                              "Sign Out",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 5),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "All Rights Reserved. \nRecylcomedia 2020.",
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 25,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
