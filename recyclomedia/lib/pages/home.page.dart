import 'package:flutter/material.dart';
import 'package:recyclomedia/fonts.dart';
import 'package:recyclomedia/pages/events.page.dart';
import 'package:recyclomedia/pages/profile.page.dart';
import 'package:recyclomedia/pages/settings.page.dart';
import 'dashboard.page.dart';
import 'package:audioplayers/audio_cache.dart';

const clicksound = "audio/click.wav";

class HomePage extends StatefulWidget {
  final _HomePageState home = _HomePageState();

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentNavIndex = 0;
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
            navigationItem(Icons.home, "H", "ome"),
            navigationItem(Icons.flag, "E", "vents"),
            navigationItem(Icons.person, "P", "rofile"),
            navigationItem(Icons.settings, "S", "ettings"),
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

  BottomNavigationBarItem navigationItem(
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
