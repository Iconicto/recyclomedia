import 'package:flutter/material.dart';
import 'package:recyclomedia/pages/login.page.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                      "lib/assets/images/signup.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 65,
                    left: 25,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0, 0),
                            blurRadius: 50.0,
                            color: Colors.black,
                          ),
                          Shadow(
                            offset: Offset(0, 0),
                            blurRadius: 70.0,
                            color: Colors.black,
                          ),
                        ],
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
                        Divider(
                          height: 20,
                          color: Colors.transparent,
                        ),
                        Text("Username"),
                        Divider(
                          height: 5,
                          color: Colors.transparent,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your username here',
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
                          height: 20,
                          color: Colors.transparent,
                        ),
                        Text("Email"),
                        Divider(
                          height: 5,
                          color: Colors.transparent,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your email here',
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
                          height: 20,
                          color: Colors.transparent,
                        ),
                        Text("Password"),
                        Divider(
                          height: 5,
                          color: Colors.transparent,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your password here',
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
                          height: 30,
                          color: Colors.transparent,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          child: Text("SIGN UP",
                              style: TextStyle(color: Colors.white)),
                          color: Colors.black,
                        ),
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
                            child: Text("OR SIGN IN?"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
