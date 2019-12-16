import 'package:flutter/material.dart';

class ManageScreen extends StatefulWidget {
  static final id = 'Manage Account';
  @override
  _ManageScreenState createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Manage Account'),
      ),
    );
  }
}
