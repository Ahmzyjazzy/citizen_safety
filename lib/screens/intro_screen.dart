import 'package:citizen_safety/components/button_solid.dart';
import 'package:citizen_safety/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class IntroScreen extends StatefulWidget {
  static String id = 'intro';
  final String title;
  IntroScreen({this.title});
  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  int _slideIndex = 0;

  final List<String> images = [
    "assets/images/discover.png",
    "assets/images/security.png",
    "assets/images/security.png",
  ];

  final List<String> heading = [
    "Discover",
    "Emergency",
    "Security",
  ];

  final List<String> subheading = [
    "Be Connected, Be Smart",
    "Emergency Hotlines",
    "Security Awareness",
  ];

  final List<String> description = [
    "Join a community dedicated to\n keeping each other safe",
    "Access country emergency hotlines\n to report security issue",
    "Receive notifications in real-time of any\n danger in your area.",
  ];

  final List<String> buttonText = [
    "Next",
    "Next",
    "Let's Start",
  ];

  final List<Color> color = [
    Color(0xFFF27E7B),
    Color(0xFFA1CC16),
    Color(0xFFB17BF2),
  ];

  final IndexController controller = IndexController();

  @override
  Widget build(BuildContext context) {
    TransformerPageView transformerPageView = TransformerPageView(
      pageSnapping: true,
      onPageChanged: (index) {
        print('changed $index}');
        setState(
          () {
            this._slideIndex = index;
          },
        );
      },
      loop: false,
      controller: controller,
      transformer: PageTransformerBuilder(
        builder: (Widget child, TransformInfo info) {
          return Material(
            color: Colors.white,
            elevation: 8.0,
            textStyle: TextStyle(color: Colors.white),
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      heading[this._slideIndex],
                      style: TextStyle(
                        color: Color(0xFF26226E),
                        fontSize: 27.0,
                      ),
                    ),
                    Container(
                      height: 500.0,
                      width: 400.0,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: new BoxDecoration(
                                color: color[this._slideIndex],
                                border: Border.all(
                                  color: Color(0xFF979797),
                                  width: 0.1,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(84.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFC28491),
                                    offset: Offset(0, 26.0),
                                    blurRadius: 49.0,
                                    spreadRadius: 5.0,
                                  ),
                                ],
                              ),
                              height: 400.0,
                              margin: EdgeInsets.symmetric(horizontal: 15.0),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  images[this._slideIndex],
                                  fit: BoxFit.fitWidth,
                                ),
                                SizedBox(
                                  height: 50.0,
                                ),
                                Text(
                                  subheading[this._slideIndex],
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  description[this._slideIndex],
                                  style: TextStyle(fontSize: 16.0),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _slideIndex == 0
                            ? Indicator(active: true)
                            : Indicator(active: false),
                        _slideIndex == 1
                            ? Indicator(active: true)
                            : Indicator(active: false),
                        _slideIndex == 2
                            ? Indicator(active: true)
                            : Indicator(active: false),
                      ],
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    ButtonSolid(
                      onPressed: () {
                        if (_slideIndex == 2) {
                          Navigator.pushReplacementNamed(
                              context, SignupScreen.id);
                        }
                        controller.move(++_slideIndex);
                      },
                      label: buttonText[this._slideIndex],
                      width: 152.0,
                      bgcolor: Color(0xFFCE63FF),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      itemCount: 3,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: transformerPageView,
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  Indicator({this.active});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14.0,
      height: 12.0,
      margin: EdgeInsets.symmetric(horizontal: 3.0),
      decoration: BoxDecoration(
        color: active ? Color(0xFFADAAF9) : Colors.transparent,
        border: Border.all(
          color:
              active ? Color(0xFFADAAF9) : Color.fromRGBO(158, 158, 158, 0.52),
          width: 1.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.elliptical(5.0, 10.0)),
      ),
    );
  }
}
