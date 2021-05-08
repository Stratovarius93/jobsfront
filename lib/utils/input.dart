import 'package:AppWork/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

OutlineInputBorder utilsloginOutlineInputBorder(Color color) =>
    OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color, width: 1.5));
OutlineInputBorder utilsloginOutlineInputBorder2(Color color) =>
    OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color));

TextStyle utilsLoginInputTextStyle(double fontWeight, Color color) =>
    GoogleFonts.getFont(fontApp,
        textStyle: TextStyle(
            color: color, fontSize: fontWeight, fontWeight: FontWeight.w500));
