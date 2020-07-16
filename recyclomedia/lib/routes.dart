import 'package:flutter/material.dart';
import 'package:recyclomedia/pages/events.page.dart';

import 'pages/home.page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/events':
        return MaterialPageRoute(builder: (_) => EventsPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}