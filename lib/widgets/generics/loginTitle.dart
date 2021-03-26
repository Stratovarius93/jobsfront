import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenericLoginTitle extends StatelessWidget {
  final String title;
  final double size;
  const GenericLoginTitle({Key key, this.title, this.size = 30})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.getFont(fontApp,
          textStyle: TextStyle(
              color: colorTextTitle,
              fontSize: size,
              fontFamily: fontApp,
              fontWeight: FontWeight.w500)),
    );
  }
}
