import 'package:flutter/material.dart';
import 'package:recyclomedia/fonts.dart';
import 'package:recyclomedia/pages/events.page.dart';
import 'package:recyclomedia/pages/profile.page.dart';
import 'package:recyclomedia/pages/settings.page.dart';
import 'dashboard.page.dart';
import 'package:audioplayers/audio_cache.dart';

const clicksound = "audio/click.wav";

class Home extends StatefulWidget {
  _HomeState home = _HomeState();
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

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentNavIndex = index);
          },
          children: [
            DashboardPage(Colors.blue),
            EventsPage(),
            ProfilePage(),
            SettingsPage()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          currentIndex: _currentNavIndex,
          items: [
            NavigationItem(Icons.home, "H", "ome"),
            NavigationItem(Icons.flag, "E", "vents"),
            NavigationItem(Icons.person, "P", "rofile"),
            NavigationItem(Icons.settings, "S", "ettings"),
          ],
        ),
      ),
    );
  }

  //navigation tap handler
  void onTabTapped(int index) {
    AudioCache player = new AudioCache();
    setState(() {
      player.play(clicksound);
      _currentNavIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
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
