import 'package:citizen_safety/components/fab_bottom_app_bar.dart';
import 'package:citizen_safety/screens/emergency_screen.dart';
import 'package:citizen_safety/screens/findhelp_screen.dart';
import 'package:citizen_safety/screens/manage_screen.dart';
import 'package:citizen_safety/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home';
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _lastSelected = 0;
  String _title = 'Welcome';

  List<Widget> _tabPages = [
    WelcomeScreen(),
    EmergencyScreen(),
    ManageScreen(),
    FindHelpScreen()
  ];

  List<String> _pageTitles = [
    WelcomeScreen.id,
    EmergencyScreen.id,
    ManageScreen.id,
    FindHelpScreen.id
  ];

  void _selectedTab(int index) {
    setState(() {
      _title = '${_pageTitles[index]}';
      _lastSelected = index;
    });
  }

  void _selectedFab(int index) {}

  Widget _currentPage(int index) {
    //set page title and return current page widget
    return _tabPages[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
        leading: Container(),
        actions: <Widget>[
          IconButton(
            onPressed: () {

            },
            icon: Icon(
              Icons.share,
              size: 20,
            ),
          ),
        ],
      ),
      body: Center(
        child: _currentPage(_lastSelected),
      ),
      bottomNavigationBar: FABBottomAppBar(
//        centerItemText: 'A',
        color: Colors.grey,
        selectedColor: Color(0xFFB17BF2),
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(
              iconData: FontAwesomeIcons.handsHelping, text: 'BeSafe'),
          FABBottomAppBarItem(iconData: Icons.flash_on, text: 'Emergency'),
          FABBottomAppBarItem(
              iconData: FontAwesomeIcons.userFriends, text: 'Manage'),
          FABBottomAppBarItem(
              iconData: FontAwesomeIcons.searchLocation, text: 'Find Help'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
