import 'package:flutter/material.dart';
import 'package:recyclomedia/images.dart';
import 'package:recyclomedia/widgets/hero_banner.widget.dart';

class AboutUsPage extends StatefulWidget {
  AboutUsPage();

  @override
  State<StatefulWidget> createState() {
    return AboutUsPageState();
  }
}

class AboutUsPageState extends State<AboutUsPage> {
  Widget _buildHeroBannerContent() {
    return Positioned(
      bottom: MediaQuery.of(context).viewPadding.top < 0 ? 65 : 20,
      left: 25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "This is",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "Our Team",
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
    return Scaffold(
      body: Column(
        children: [
          HeroBanner(
            imageURI: Images.sunset,
            child: _buildHeroBannerContent(),
          ),
          Expanded(
            flex: MediaQuery.of(context).size.height > 680 ? 2 : 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
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
                        _buildTeamMemberItem("Akassharjun Shanmugarajah"),
                        Divider(
                          color: Colors.transparent,
                          height: 15,
                        ),
                        _buildTeamMemberItem("Isala Piyarisi"),
                        Divider(
                          color: Colors.transparent,
                          height: 15,
                        ),
                        _buildTeamMemberItem("Visal Rajapakse"),
                        Divider(
                          color: Colors.transparent,
                          height: 15,
                        ),
                        _buildTeamMemberItem("Suvin Nimnaka"),
                        Divider(
                          color: Colors.transparent,
                          height: 15,
                        ),
                        _buildTeamMemberItem("Thivvyan Karuneswaran"),
                        Divider(
                          color: Colors.transparent,
                          height: 15,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "All Rights Reserved. \nRecylcomedia 2020.",
                          textAlign: TextAlign.center,
                          textScaleFactor: 0.8,
                          style: TextStyle(color: Colors.red),
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
          ),
        ],
      ),
    );
  }

  Container _buildTeamMemberItem(String name) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                height: 45.0,
                width: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/${name.replaceFirst(' ', '_').toLowerCase()}.jpg"),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                height: 45,
                width: 2,
                color: Colors.black,
              ),
              Text(
                '${name.replaceFirst(' ', '\n')}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              )
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 5),
      ),
    );
  }
}
