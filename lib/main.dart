import 'package:citizen_safety/config/config_page.dart';
import 'package:citizen_safety/utilities/swift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  //* Forcing only portrait orientation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //* Set mock initial value
//  SharedPreferences.setMockInitialValues({});

  // * Get Shared Preference Instance for whole app
  Swift.prefs = await SharedPreferences.getInstance();

  print('Log ${Swift.prefs.getBool('firstLaunch')}');

  runApp(ConfigPage());
}
