import 'package:citizen_safety/utilities/constants.dart';
import 'package:citizen_safety/utilities/swift.dart';
import 'package:flutter/material.dart';

class SwiftInput extends StatefulWidget {
  SwiftInput(
      {this.labelText,
      this.hintText,
      this.iconType,
      this.inputType,
      this.obscureText,
      this.validator,
      this.onSaved,
      this.targetText,
      this.defaultText,
      this.prefixIcon,
      this.validationType});

  final IconData iconType;
  final String labelText;
  final String hintText;
  final String targetText;
  final String validationType;
  final String defaultText;
  final bool prefixIcon;
  final TextInputType inputType;
  final bool obscureText;
  final Function validator;
  final Function onSaved;

  @override
  _SwiftInputState createState() => _SwiftInputState();
}

class _SwiftInputState extends State<SwiftInput> {
  final _textController = TextEditingController();
  bool _validate = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_checkValid);
    if (widget.defaultText?.isEmpty == false) {
      _textController.text = widget.defaultText;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  _checkValid() {
    setState(() {
      switch (widget.validationType.toLowerCase()) {
        case 'email':
          _validate = Swift.isValidEmail(_textController.text);
          break;
        case 'password':
          _validate = Swift.isValidPassword(_textController.text);
          break;
        case 'name':
          _validate = Swift.isValidName(_textController.text);
          break;
        case 'equalfield':
          _validate = _textController.text == widget.targetText;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textController,
      obscureText: widget.obscureText,
      keyboardType: widget.inputType,
      validator: widget.validator,
      onSaved: widget.onSaved,
      cursorColor: Color(0xFF634075),
      style: kControlTextStyle,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon == true
            ? Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(0xFF634075),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5],
                    colors: [
                      Color.fromRGBO(60, 16, 83, 0.6),
                      Color(0xFFad5389),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Icon(
                  widget.iconType,
                  size: 16.0,
                  color: Colors.white,
                ),
              )
            : null,
        suffixIcon: _validate
            ? Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                      width: 1.0,
                      color: Color(0xFFad5389),
                    )),
                child: Icon(
                  Icons.check,
                  size: 16.0,
                  color: Color(0xFFad5389),
                ),
              )
            : null,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: widget.hintText,
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
