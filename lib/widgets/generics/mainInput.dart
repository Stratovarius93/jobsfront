import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/utils/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenericMainInput extends StatefulWidget {
  final TextInputType textInputType;
  final bool obscureText;
  final VoidCallback onTap;
  final Icon suffixIcon;
  final TextEditingController controller;
  final int maxLines;
  final int minLines;
  final ScrollPhysics scrollPhysics;
  final List<TextInputFormatter> inputFormatters;
  const GenericMainInput(
      {Key key,
      this.textInputType,
      this.obscureText,
      this.onTap,
      this.suffixIcon,
      this.controller,
      this.maxLines,
      this.minLines,
      this.scrollPhysics,
      this.inputFormatters})
      : super(key: key);
  @override
  _GenericMainInputState createState() => _GenericMainInputState();
}

class _GenericMainInputState extends State<GenericMainInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        inputFormatters: [],
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        scrollPhysics: widget.scrollPhysics,
        controller: widget.controller,
        onTap: widget.onTap,
        keyboardType: widget.textInputType,
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(
            suffixIcon: widget.suffixIcon,
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
