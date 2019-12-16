import 'package:citizen_safety/components/button_outline.dart';
import 'package:citizen_safety/components/button_solid.dart';
import 'package:citizen_safety/components/privacy_terms.dart';
import 'package:citizen_safety/components/swift_input.dart';
import 'package:citizen_safety/screens/signup_screen.dart';
import 'package:citizen_safety/utilities/swift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResetPasswordScreen extends StatefulWidget {
  static String id = 'resetpassword';

  final String email;
  ResetPasswordScreen({this.email});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email, _password;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleSubmit(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('$_email, $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    SwiftInput passwordField = SwiftInput(
      labelText: 'Password',
      hintText: 'Password',
      inputType: TextInputType.visiblePassword,
      obscureText: true,
      validator: Swift.validatePassword,
      validationType: 'password',
      onSaved: (String val) {
        _password = val;
      },
    );
    SwiftInput cpasswordField = SwiftInput(
      labelText: 'Confirm Password',
      hintText: 'Confirm Password',
      inputType: TextInputType.visiblePassword,
      obscureText: true,
      validator: Swift.validatePassword,
      validationType: 'password',
      onSaved: (String val) {
        _password = val;
      },
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xFFB17BF2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'BeSafe',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Be alert and stay safe',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Reset Password',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: passwordField,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: cpasswordField,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: ButtonSolid(
                                width: MediaQuery.of(context).size.width,
                                label: 'Confirm Password',
                                bgcolor: Color(0xFFB17BF2),
                                borderRadius: 5.0,
                                onPressed: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  _handleSubmit(context);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            SizedBox(height: 10.0),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 10.0),
                              child: ButtonOutline(
                                width: MediaQuery.of(context).size.width,
                                label: 'Don\'t have an account? Sign Up',
                                borderColor: Color(0xFFB17BF2),
                                textColor: Color(0xFFB17BF2),
                                borderRadius: 5.0,
                                onPressed: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  Navigator.pushReplacementNamed(
                                      context, SignupScreen.id);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: 20.0,
                      ),
                      child: PrivacyTerms(),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
