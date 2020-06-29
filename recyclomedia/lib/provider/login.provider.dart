import 'package:flutter/material.dart';
import 'package:recyclomedia/api/login.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginModel extends ChangeNotifier {
  String email;
  String password;

  Future<bool> authenticate() async {
    LoginService loginService = LoginService();

    var user = await loginService.authenticate(email, password);

    if (user == null) {
      return false;
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setBool('loggedIn', true);
      return true;
    }
  }
}

