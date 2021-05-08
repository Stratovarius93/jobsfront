import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/utils/input.dart';
import 'package:flutter/material.dart';

class GenericLoginInput extends StatefulWidget {
  final TextInputType textInputType;
  final bool obscureText;

  const GenericLoginInput({Key key, this.textInputType, this.obscureText})
      : super(key: key);
  @override
  _GenericLoginInputState createState() => _GenericLoginInputState();
}

class _GenericLoginInputState extends State<GenericLoginInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: widget.textInputType,
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            enabledBorder: utilsloginOutlineInputBorder(Theme.of(context)
                .inputDecorationTheme
                .enabledBorder
                .borderSide
                .color),
            border: utilsloginOutlineInputBorder2(
                Theme.of(context).inputDecorationTheme.border.borderSide.color),
            filled: true,
            fillColor: Theme.of(context).inputDecorationTheme.fillColor),
        style: utilsLoginInputTextStyle(screenWidth(context) * 0.05,
            Theme.of(context).inputDecorationTheme.labelStyle.color));
  }
}
