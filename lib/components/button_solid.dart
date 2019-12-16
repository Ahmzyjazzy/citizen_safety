import 'package:citizen_safety/utilities/constants.dart';
import 'package:citizen_safety/utilities/swift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonSolid extends StatelessWidget {
  ButtonSolid(
      {@required this.onPressed,
      @required this.label,
      this.width,
      this.bgcolor,
      this.borderRadius,
      this.buttonIcon,
      this.textColor});

  final Function onPressed;
  final String label;
  final double width;
  final Color bgcolor;
  final Color textColor;
  final double borderRadius;
  final Icon buttonIcon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width == null ? null : width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      color: bgcolor,
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
                color: Swift.primaryAppColor,
              ),
            ),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(borderRadius != null ? borderRadius : 28.5),
      ),
    );
  }
}
