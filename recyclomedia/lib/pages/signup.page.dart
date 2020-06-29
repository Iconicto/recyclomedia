import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recyclomedia/pages/home.page.dart';
import 'package:recyclomedia/pages/login.page.dart';
import 'package:recyclomedia/provider/signup.provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpModel _signUpModel;

  @override
  Widget build(BuildContext context) {
    _signUpModel = Provider.of<SignUpModel>(context, listen:true);

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
                        fontWeight: FontWeight.bold),
                  ),
                )
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
                        onChanged: (value) {
                          _signUpModel.username = value;
                        },
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
                        onChanged: (value) {
                          _signUpModel.email = value;
                        },
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
                        onChanged: (value) {
                          _signUpModel.password = value;
                        },
                      ),
                      Divider(
                        height: 30,
                        color: Colors.transparent,
                      ),
                      GestureDetector(
                        onTap:  () async {
                          if (await _signUpModel.register()){
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => Home(),
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Text("An error occured, try again later!"),
                                actions: [
                                  FlatButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          child: Text("SIGN UP",
                              style: TextStyle(color: Colors.white)),
                          color: Colors.black,
                        ),
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
    );
  }
}