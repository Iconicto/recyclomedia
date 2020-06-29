import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recyclomedia/fonts.dart';
import 'package:recyclomedia/pages/landing.page.dart';
import 'package:recyclomedia/provider/login.provider.dart';
import 'package:recyclomedia/provider/signup.provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginModel>(create: (context) => LoginModel()),
        ChangeNotifierProvider<SignUpModel>(create: (context) => SignUpModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: Fonts.SilkScreen,
        ),
        home: LandingPage(),
      ),
    );
  }
}
