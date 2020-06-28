import 'package:flutter/material.dart';
import 'package:recyclomedia/colors.dart';
import 'package:recyclomedia/fonts.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {

  int _currentNavItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentNavItem, // this will be set when a new tab is tapped
        items: [
          NavigationItem(Icons.home, "H", "ome"),
          NavigationItem(Icons.flag, "E", "vents"),
          NavigationItem(Icons.person, "P", "rofile"),
          NavigationItem(Icons.settings, "S", "ettings"),
        ],
      ),
    );
  }

  BottomNavigationBarItem NavigationItem(IconData icon, String underlinedNavTitleText, String navTitleText) {
    return BottomNavigationBarItem(
          icon: Icon(icon),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                underlinedNavTitleText,
                style: TextStyle(
                    fontFamily: Fonts.DisposableDroid,
                    fontSize: FontSize.NavItem,
                    decoration: TextDecoration.underline),
              ),
              Text(
                navTitleText,
                style: TextStyle(
                    fontFamily: Fonts.DisposableDroid,
                    fontSize: FontSize.NavItem),
              )
            ],
          ),
        );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentNavItem = index;
    });
  }
}
