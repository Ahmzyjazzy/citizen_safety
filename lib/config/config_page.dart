import 'package:citizen_safety/screens/home_screen.dart';
import 'package:citizen_safety/screens/intro_screen.dart';
import 'package:citizen_safety/screens/signup_screen.dart';
import 'package:citizen_safety/utilities/routes.dart';
import 'package:citizen_safety/utilities/swift.dart';
import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  bool isfirstLaunch;
  String userData;

  Future<void> launchApp() async {
    //check to navigate to intro screen or login
    isfirstLaunch = Swift.prefs.getBool('firstLaunch') ?? true;
    userData = Swift.prefs.getString('user') ?? null;
    await Swift.prefs.setBool('firstLaunch', false);
  }

  @override
  void initState() {
    super.initState();
    launchApp();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swift Accounting',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: Swift.google_sans_family,
        primarySwatch: Swift.customPurple,
//        primaryColor: Colors.white,
        disabledColor: Colors.grey,
        cardColor: Colors.white,
        canvasColor: Colors.grey[50],
//        brightness: Brightness.light,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              colorScheme: ColorScheme.light(),
            ),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
        ),
      ),
      home: (isfirstLaunch
          ? IntroScreen()
          : (userData != null ? HomeScreen() : SignupScreen())),
      routes: routes,
    );
  }
}
