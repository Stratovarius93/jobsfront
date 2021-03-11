import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

OutlineInputBorder utilsloginOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: colorBorderInput, width: 1.5));
OutlineInputBorder utilsloginOutlineInputBorder2 = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: colorBorderInputSelected));

TextStyle utilsLoginInputTextStyle(double fontWeight) =>
    GoogleFonts.getFont(fontApp,
        textStyle: TextStyle(
            color: colorTextInput,
            fontSize: fontWeight,
            fontWeight: FontWeight.w500));
