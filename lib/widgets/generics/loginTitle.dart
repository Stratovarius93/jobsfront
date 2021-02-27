import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenericLoginTitle extends StatelessWidget {
  final String title;
  const GenericLoginTitle({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.getFont(fontApp,
          textStyle: TextStyle(
              color: colorTextTitle,
              fontSize: screenWidth(context) * 0.07,
              fontFamily: fontApp,
              fontWeight: FontWeight.w500)),
    );
  }
}
