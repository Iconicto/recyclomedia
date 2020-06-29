import 'package:flutter/material.dart';
import 'package:recyclomedia/api/signup.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpModel extends ChangeNotifier {
  String email;
  String username;
  String password;

  Future<bool> register() async {
    print(email);
    print(username);
    print(password);

    bool created = await SignUpService().register(email, username, password);

    if (created) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      await prefs.setString('username', username);
      await prefs.setString('password', password);
      await prefs.setBool('loggedIn', true);

      return true;
    } else {
      return false;
    }
  }
}
