import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:recyclomedia/images.dart';

const levelsound = "audio/pageload.wav";
const eventsound = "audio/eventsound.wav";

class ProfilePage extends StatefulWidget {
  ProfilePage();

  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  static AudioCache player = new AudioCache();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  Images.urbanGIF,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).viewPadding.top < 0 ? 65 : 20,
                left: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back,",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "akassharjun",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: MediaQuery.of(context).size.height > 680 ? 1 : 2,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: Colors.transparent,
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: GestureDetector(
                      onTap: () => player.play(levelsound),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('lib/assets/images/level.png'),
                          Text(
                            "Level 10",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 5),
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: GestureDetector(
                      onTap: () => player.play(eventsound),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('lib/assets/images/event.png'),
                          Text(
                            "10 Event(s)",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 5),
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 15,
                  ),
                  Text(
                    "Badges",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset('lib/assets/images/beginner.png'),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "RECYLO-STARTER",
                                style: TextStyle(fontSize: 19),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 5),
                    ),
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset('lib/assets/images/earthlover.png'),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "EARTH LOVER",
                                style: TextStyle(fontSize: 19),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 5),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
