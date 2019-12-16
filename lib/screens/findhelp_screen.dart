import 'package:flutter/material.dart';

class FindHelpScreen extends StatefulWidget {
  static final id = 'Find Help';
  @override
  _FindHelpScreenState createState() => _FindHelpScreenState();
}

class _FindHelpScreenState extends State<FindHelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Find Help Page'),
      ),
    );
  }
}
