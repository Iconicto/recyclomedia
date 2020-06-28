import 'package:flutter/material.dart';
import 'package:recyclomedia/pages/login.page.dart';
import 'package:recyclomedia/pages/signup.page.dart';

class LandingPage extends StatelessWidget {
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
                  top: MediaQuery.of(context).viewPadding.top < 0 ? 65 : 40,
                  left: 25,
                  child: Text(
                    "RECYCLOMEDIA",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
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
