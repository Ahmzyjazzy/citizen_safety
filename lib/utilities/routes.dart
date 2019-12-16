import 'package:citizen_safety/screens/forget_password_screen.dart';
import 'package:citizen_safety/screens/home_screen.dart';
import 'package:citizen_safety/screens/intro_screen.dart';
import 'package:citizen_safety/screens/reset_password_screen.dart';
import 'package:citizen_safety/screens/signin_screen.dart';
import 'package:citizen_safety/screens/signup_screen.dart';
import 'package:flutter/material.dart';

final routes = {
  SigninScreen.id: (BuildContext context) => SigninScreen(),
  SignupScreen.id: (BuildContext context) => SignupScreen(),
  ForgotPasswordScreen.id: (BuildContext context) => ForgotPasswordScreen(),
  ResetPasswordScreen.id: (BuildContext context) => ResetPasswordScreen(),
  IntroScreen.id: (BuildContext context) => IntroScreen(),
  HomeScreen.id: (BuildContext context) => HomeScreen(),
};
