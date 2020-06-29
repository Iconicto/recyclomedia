import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  AboutUsPage();

  @override
  State<StatefulWidget> createState() {
    return AboutUsPageState();
  }
}

class AboutUsPageState extends State<AboutUsPage> {
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
                  child: Image.asset(
                    "lib/assets/images/login.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
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
                        "About US",
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => AboutUsPage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.question_answer),
                                  Text(
                                    "ABOUT US",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.transparent,
                                height: 15,
                              ),
                              Container(
                                child: Text(
                                    "We, Iconicto, are a team of 5 undergraduates from Sri Lanka who think.create!",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(fontSize: 17)),
                              )
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
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  height: 60.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "lib/assets/images/isala.jpg"))),
                                ),
                                Text(
                                  "Isala",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  height: 60.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "lib/assets/images/suvin.jpg"))),
                                ),
                                Text(
                                  "Suvin",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  height: 60.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "lib/assets/images/akash.jpg"))),
                                ),
                                Text(
                                  "Akash",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  height: 60.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "lib/assets/images/visal.jpg"))),
                                ),
                                Text(
                                  "Visal",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  height: 60.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "lib/assets/images/thivvyan.jpg"))),
                                ),
                                Text(
                                  "Thivvyan",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
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
        ],
      ),
    );
  }
}
