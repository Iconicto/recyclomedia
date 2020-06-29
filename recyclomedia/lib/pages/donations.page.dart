import 'package:flutter/material.dart';
import 'package:recyclomedia/fonts.dart';
import 'package:recyclomedia/images.dart';
import 'package:audioplayers/audio_cache.dart';
import 'login.page.dart';

const donatesound = "audio/donate.wav";

class DonationsPage extends StatefulWidget {
  @override
  _DonationsPageState createState() => _DonationsPageState();
}

class _DonationsPageState extends State<DonationsPage> {
  static AudioCache player = new AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.red,
                  child: Image.asset(
                    Images.donationsGIF,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).viewPadding.top < 0 ? 65 : 20,
                  left: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.chevron_left,
                              color: Colors.black,
                              size: 40,
                            ),
                          ],
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
            child: Container(
              height: double.infinity,
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Donations",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        height: 10,
                        color: Colors.transparent,
                      ),
                      Text(
                        "We are people of same earth trying to save the very world we live on. Our goal is to promote environmental activism and donate to charities. So help us make this world a better place.",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.justify,
                      ),
                      Divider(
                        height: 15,
                        color: Colors.transparent,
                      ),
                      Text("Amount"),
                      Divider(
                        height: 5,
                        color: Colors.transparent,
                      ),
                      TextField(
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          hintText: '\$',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                      Divider(
                        height: 25,
                        color: Colors.transparent,
                      ),
                      GestureDetector(
                        onTap: () {
                          player.play(donatesound);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  Images.ringGIF,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Divider(
                                color: Colors.transparent,
                              ),
                              Text("DONATE",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
