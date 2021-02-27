import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/utils/shadows.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenericPrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const GenericPrimaryButton(
      {Key key, @required this.title, @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(boxShadow: [shadowPrimaryButton(colorPrimaryButton)]),
      child: FlatButton(
        child: Text(
          title,
          style: GoogleFonts.getFont(fontApp,
              textStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: colorPrimaryButtonText,
                  fontSize: screenWidth(context) * 0.05)),
        ),
        onPressed: onPressed,
        color: colorPrimaryButton,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        height: 56,
        minWidth: screenWidth(context) * 0.42,
      ),
    );
  }
}
