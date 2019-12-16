import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static final id = 'BeSafe';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Be Safe'),
          ],
        ),
      ),
    );
  }
}
