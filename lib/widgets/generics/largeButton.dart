import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeButton extends StatefulWidget {
  final Color backgroundColor;
  final Color color;
  final String text;
  final VoidCallback onTap;
  final Color shadow;
  final double elevation;
  final bool enable;
  const LargeButton(
      {Key key,
      this.backgroundColor = Colors.transparent,
      this.color,
      @required this.text,
      @required this.onTap,
      this.shadow = Colors.transparent,
      this.elevation = 0.0,
      this.enable = true})
      : super(key: key);

  @override
  _LargeButtonState createState() => _LargeButtonState();
}

class _LargeButtonState extends State<LargeButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.enable == true) {
      return Container(
        width: screenWidth(context) - 32,
        child: TextButton(
          onPressed: widget.onTap,
          child: Text(
            widget.text,
            style: GoogleFonts.getFont(fontApp,
                textStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: widget.color,
                    fontSize: screenWidth(context) * 0.05)),
          ),
          style: TextButton.styleFrom(
              elevation: widget.elevation,
              shadowColor: widget.shadow,
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              backgroundColor: widget.backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
        ),
      );
    } else {
      return Container(
        width: screenWidth(context) - 32,
        child: TextButton(
          onPressed: null,
          child: Text(
            widget.text,
            style: GoogleFonts.getFont(fontApp,
                textStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: widget.color,
                    fontSize: screenWidth(context) * 0.05)),
          ),
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              backgroundColor: Colors.grey.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
        ),
      );
    }
  }
}
