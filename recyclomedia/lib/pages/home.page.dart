import 'package:flutter/material.dart';
import 'package:recyclomedia/fonts.dart';
import 'package:recyclomedia/pages/events.page.dart';
import 'package:recyclomedia/pages/profile.page.dart';
import 'package:recyclomedia/pages/settings.page.dart';
import 'dashboard.page.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentNavIndex = 0;
  final List<Widget> _children = [
    DashboardPage(Colors.blue),
    EventsPage(),
    ProfilePage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentNavIndex,
        items: [
          NavigationItem(Icons.home, "H", "rme"),
          NavigationItem(Icons.flag, "E", "vents"),
          NavigationItem(Icons.person, "P", "rofile"),
          NavigationItem(Icons.settings, "S", "ettings"),
        ],
      ),
    );
  }

  //navigation tap handler
  void onTabTapped(int index) {
    setState(() {
      _currentNavIndex = index;
    });
  }

  BottomNavigationBarItem NavigationItem(
      IconData icon, String underlinedNavTitleText, String navTitleText) {
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
                fontFamily: Fonts.DisposableDroid, fontSize: FontSize.NavItem),
          )
        ],
      ),
    );
  }
}
