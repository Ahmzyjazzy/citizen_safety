import 'dart:core';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Swift {
  static const String app_name = "Citizen Safety";
  static const String app_version = "Version 1.0.0";
  static const int app_version_code = 1;
  static const String app_color = "#ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondaryAppColor = Colors.black;
  static Color customPurple = Colors.purple;
  static const String google_sans_family = "GoogleSans";
  static bool isDebugMode = false;
  static const apiUrl = 'https://swiftledger.com/swiftservice';
  static const webUrl = 'https://swiftledger.com/swiftledger/';

  //* Images
  static const String welcome_img = "assets/images/group_presentation.png";
  static const String lock_img = "assets/images/password.png";

  //*  Texts
  static const String loginNote =
      "Manage your suppliers, customers, expenses, cash flow, payroll and inventory amongst other business activities from anywhere";
  static const String loading_text = "Loading...";
  static const String try_again_text = "Try Again";
  static const String some_error_text = "Some error";
  static const String signInText = "Sign In";
  static const String signUpText = "Sign up";
  static const String forgetPasswordText = "Forgot Password?";
  static const String resetText = "Reset Password";
  static const String wrongText = "Something went wrong";
  static const String confirmText = "Confirm";
  static const String supportText = "Support Needed";
  static const String featureText = "Feature Request";
  static const String moreFeatureText = "More Features coming soon.";
  static const String updateNowText =
      "Please update your app for seamless experience.";
  static const String checkNetText =
      "It seems like your internet connection is not active.";

  //* ActionTexts

  //* Preferences
  static SharedPreferences prefs;

  //*  SQLite

  static String validateName(String value) {
    // Nigeria Mobile number are of 11 digit only
    if (value.length < 3 ||
        value.trim().contains(RegExp(r'[\s!@#$%^&*(),.?":{}|<>]')))
      return 'Enter valid name character';
    else
      return null;
  }

  static String validatePassword(String value) {
    if (value.length < 6)
      return 'Password must be 6 or more charater';
    else
      return null;
  }

  //* Function
  static String validateMobile(String value) {
    // Nigeria Mobile number are of 11 digit only
    if (value.length != 11)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  static String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  static bool isValidName(String value) {
    // Nigeria Mobile number are of 11 digit only
    if (value.length < 3 ||
        value.trim().contains(RegExp(r'[\s!@#$%^&*(),.?":{}|<>]')))
      return false;
    else
      return true;
  }

  static bool isValidEmail(value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  static bool isValidPassword(String value) {
    if (value.length < 6)
      return false;
    else
      return true;
  }

  static String createQueryString(
      {String table, Map<String, dynamic> columnData, String primaryKey}) {
    String table = 'user';
    var buffer = new StringBuffer();
    buffer.write('CREATE TABLE IF NOT EXISTS $table(');
    //create table if not exist
    columnData.forEach((key, value) {
      //check for primary key first
      if (key.toLowerCase() == primaryKey.toLowerCase()) {
        buffer.write('$key integer primary key autoincrement,');
      } else {
        (value != null && value is String)
            ? buffer.write('$key text not null,')
            : buffer.write('$key integer not null,');
      }
    });
    //close
    buffer.write(')');
    return buffer.toString();
  }

  static showToast({String msg, String toastType}) {
    Map<String, Color> type = {
      'error': Colors.red,
      'success': Colors.green,
      'info': Colors.blue,
      'warning': Colors.yellow,
      'default': Colors.black54
    };

    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 3,
        backgroundColor: toastType != null ? type[toastType] : type['default'],
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
