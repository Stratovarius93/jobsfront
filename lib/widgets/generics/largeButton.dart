import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeButton extends StatelessWidget {
  final Color backgroundColor;
  final Color color;
  final String text;
  final VoidCallback onTap;
  final Color shadow;
  final double elevation;

  const LargeButton(
      {Key key,
      this.backgroundColor = Colors.transparent,
      this.color,
      @required this.text,
      @required this.onTap,
      this.shadow = Colors.transparent,
      this.elevation = 0.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context) - 32,
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: GoogleFonts.getFont(fontApp,
              textStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: color,
                  fontSize: screenWidth(context) * 0.05)),
        ),
        style: TextButton.styleFrom(
            elevation: elevation,
            shadowColor: shadow,
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
      ),
    );
  }
}
