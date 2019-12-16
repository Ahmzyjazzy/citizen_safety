import 'package:citizen_safety/components/button_outline.dart';
import 'package:citizen_safety/components/button_solid.dart';
import 'package:citizen_safety/components/privacy_terms.dart';
import 'package:citizen_safety/components/swift_input.dart';
import 'package:citizen_safety/screens/home_screen.dart';
import 'package:citizen_safety/screens/signin_screen.dart';
import 'package:citizen_safety/utilities/swift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatefulWidget {
  static String id = 'signup';

  final String email;
  SignupScreen({this.email});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  bool _autoValidate = false;
  String _email, _password, _fname, _lname;

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
      print('$_email, $_password, $_fname, $_lname');
      await Swift.prefs.setString('user', '$_email,$_password');
      Navigator.pushReplacementNamed(context, HomeScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    SwiftInput fnameField = SwiftInput(
      labelText: 'First Name',
      hintText: 'First Name',
      inputType: TextInputType.text,
      obscureText: false,
      validator: Swift.validateName,
      validationType: 'name',
      onSaved: (String val) {
        _fname = val;
      },
    );
    SwiftInput lnameField = SwiftInput(
      labelText: 'Last Name',
      hintText: 'Last Name',
      inputType: TextInputType.text,
      obscureText: false,
      validator: Swift.validateName,
      validationType: 'name',
      onSaved: (String val) {
        _lname = val;
      },
    );
    SwiftInput emailField = SwiftInput(
      labelText: 'Email',
      hintText: 'Email',
      defaultText: widget.email != null ? widget.email : "",
      inputType: TextInputType.emailAddress,
      obscureText: false,
      validator: Swift.validateEmail,
      validationType: 'email',
      onSaved: (String val) {
        _email = val;
      },
    );
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
                              Swift.signUpText,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.all(5.0),
                                      child: fnameField,
                                    )),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: lnameField,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: emailField,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: passwordField,
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
                                label: 'Create an Account',
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
                              height: 20.0,
                            ),
                            Text(
                              'Or',
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: ButtonSolid(
                                      label: 'Facebook',
                                      bgcolor: Colors.blueAccent,
                                      borderRadius: 5.0,
                                      buttonIcon: Icon(
                                        FontAwesomeIcons.facebookF,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: ButtonSolid(
                                      label: 'Google',
                                      bgcolor: Colors.white,
                                      borderRadius: 5.0,
                                      textColor: Colors.black54,
                                      buttonIcon: Icon(FontAwesomeIcons.google,
                                          color: Colors.red),
                                      onPressed: () {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 10.0),
                              child: ButtonOutline(
                                width: MediaQuery.of(context).size.width,
                                label: 'Have an account? Sign In',
                                borderColor: Color(0xFFB17BF2),
                                textColor: Color(0xFFB17BF2),
                                borderRadius: 5.0,
                                onPressed: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  Navigator.pushNamed(context, SigninScreen.id);
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
                    child: PrivacyTerms(),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
