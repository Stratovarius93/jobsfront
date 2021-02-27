import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenericLoginSubTitle extends StatelessWidget {
  final String title;
  final TextAlign textAlign;
  const GenericLoginSubTitle({Key key, @required this.title, this.textAlign})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: GoogleFonts.getFont(fontApp,
          textStyle: TextStyle(
            color: colorTextSubTitle,
            fontSize: screenWidth(context) * 0.05,
            fontWeight: FontWeight.w400,
          )),
    );
  }
}
