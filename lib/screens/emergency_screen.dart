import 'package:flutter/material.dart';

class EmergencyScreen extends StatefulWidget {
  static final id = 'Emergency';
  @override
  _EmergencyScreenState createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Emergency Page'),
      ),
    );
  }
}
