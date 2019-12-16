import 'package:citizen_safety/utilities/constants.dart';
import 'package:citizen_safety/utilities/swift.dart';
import 'package:flutter/material.dart';

class ButtonOutline extends StatelessWidget {
  ButtonOutline(
      {this.onPressed,
      this.label,
      this.width,
      this.borderColor,
      this.textColor,
      this.borderRadius,
      this.buttonIcon});

  final Function onPressed;
  final String label;
  final double width;
  final Color borderColor;
  final Color textColor;
  final double borderRadius;
  final Icon buttonIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == null ? null : width,
      child: OutlineButton(
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: onPressed,
        child: buttonIcon != null
            ? Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: buttonIcon,
                      ),
                    ),
                    Expanded(
                      flex: 11,
                      child: Text(
                        label,
                        textAlign: TextAlign.center,
                        style: kControlTextStyle.copyWith(
                          color: textColor != null
                              ? textColor
                              : Swift.primaryAppColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Text(
                label,
                textAlign: TextAlign.center,
                style: kControlTextStyle.copyWith(
                  color: textColor,
                ),
              ),
        borderSide: BorderSide(
          color: borderColor, //Color of the border
          style: BorderStyle.solid, //Style of the border
          width: 0.8, //width of the border
        ),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(borderRadius != null ? borderRadius : 10.0),
        ),
      ),
    );
  }
}
