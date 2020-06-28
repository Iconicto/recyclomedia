import 'package:flutter/material.dart';
import 'package:recyclomedia/images.dart';
import 'package:recyclomedia/pages/login.page.dart';
import 'package:recyclomedia/pages/signup.page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final vw = MediaQuery.of(context).size.width;

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
                    Images.palmsGIF,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Text(
                    "RECYCLOMEDIA",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: vw * 0.12,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0, 0),
                            blurRadius: 70.0,
                            color: Colors.black,
                          ),
                          Shadow(
                            offset: Offset(0, 0),
                            blurRadius: 60.0,
                            color: Colors.black,
                          ),
                        ],
                      letterSpacing: -5
                        ),
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
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          child: Text("SIGN IN",
                              style: TextStyle(color: Colors.white)),
                          color: Colors.black,
                        ),
                      ),
                      Divider(
                        height: 30,
                        color: Colors.transparent,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          child: Text("SIGN UP",
                              style: TextStyle(color: Colors.white)),
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
