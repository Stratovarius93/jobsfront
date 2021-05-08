import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenericLoginCategoryText extends StatelessWidget {
  final String title;

  const GenericLoginCategoryText({Key key, @required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(title.toUpperCase(),
        style: GoogleFonts.getFont(fontApp,
            textStyle: TextStyle(
              color: Theme.of(context).textTheme.subtitle1.color,
              fontSize: screenWidth(context) * 0.045,
              fontWeight: FontWeight.w600,
            )));
  }
}
