import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/colorsDark.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

ThemeData lightThemeData(BuildContext context, Brightness brightness) {
  return ThemeData.light().copyWith(
      scaffoldBackgroundColor: backgroundColor2,
      brightness: brightness,
      appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(color: colorArrowBack),
          brightness: Brightness.light),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: colorPrimaryButton),
      toggleButtonsTheme:
          ToggleButtonsThemeData(selectedColor: colorsToggleButton),
      textTheme: TextTheme(
        headline6: TextStyle(color: colorTextTitle),
        headline5: TextStyle(color: colorHeadline5),
        subtitle1: TextStyle(color: colorTextSubTitle),
        bodyText1: TextStyle(color: colorBodyText1),
        bodyText2: TextStyle(color: colorBodyText2),
      ),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: colorHintTextInput),
          suffixStyle: TextStyle(color: colorBorderInput),
          labelStyle: TextStyle(color: colorTextInput),
          fillColor: colorFillInput,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: colorBorderInputSelected)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorBorderInput))),
      cardTheme:
          CardTheme(color: colorBackgroundCard, shadowColor: colorShadowCard),
      primaryColor: colorPrimaryButton,
      backgroundColor: backgroundColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colorBackgroundNavBar,
          unselectedItemColor: colorIconsNavBar));
}

ThemeData darkThemeData(BuildContext context, Brightness brightness) {
  return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: darkBackgroundColor2,
      brightness: brightness,
      appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(color: darkColorArrowBack),
          brightness: Brightness.dark),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: darkColorPrimaryButton),
      toggleButtonsTheme:
          ToggleButtonsThemeData(selectedColor: darkColorsToggleButton),
      textTheme: TextTheme(
        headline6: TextStyle(color: darkColorTextTitle),
        headline5: TextStyle(color: darkColorHeadline5),
        subtitle1: TextStyle(color: darkColorTextSubTitle),
        bodyText1: TextStyle(color: darkColorBodyText1),
        bodyText2: TextStyle(color: darkColorBodyText2),
      ),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: darkColorHintTextInput),
          suffixStyle: TextStyle(color: darkColorTextInput),
          labelStyle: TextStyle(color: darkColorTextInput),
          fillColor: darkColorFillInput.withOpacity(0.2),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: darkColorBorderInputSelected)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: darkColorBorderInput))),
      cardTheme: CardTheme(
          color: darkColorBackgroundCard, shadowColor: darkColorShadowCard),
      primaryColor: colorPrimaryButton,
      backgroundColor: darkBackgroundColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: darkColorBackgroundNavBar,
          unselectedItemColor: darkColorIconsNavBar));
}
