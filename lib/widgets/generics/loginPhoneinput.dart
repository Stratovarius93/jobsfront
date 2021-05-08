import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/utils/input.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class GenericInputPhone extends StatefulWidget {
  final VoidCallback onchanged1;
  final Function(String) onchanged2;
  final String code;

  const GenericInputPhone(
      {Key key, this.onchanged2, this.code, this.onchanged1})
      : super(key: key);
  @override
  _GenericInputPhoneState createState() => _GenericInputPhoneState();
}

class _GenericInputPhoneState extends State<GenericInputPhone> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _countryCodeText(context, widget.code, widget.onchanged1),
        SizedBox(
          width: 16,
        ),
        Expanded(child: _textFieldNumber(context, widget.onchanged2))
      ],
    );
  }
}

Widget _countryCodeText(BuildContext context, String text, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
          color: Theme.of(context).inputDecorationTheme.fillColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorBorderInput, width: 1.5)),
      child: Row(children: [
        Text(
          //'+ $_selectedCountryCode' ?? '+1',
          text,
          style: utilsLoginInputTextStyle(screenWidth(context) * 0.06,
              Theme.of(context).inputDecorationTheme.labelStyle.color),
        ),
        SizedBox(
          width: 12,
        ),
        Icon(
          Ionicons.chevron_down_outline,
          size: 16,
          color: colorBorderInput,
        )
      ]),
    ),
  );
}

Widget _textFieldNumber(BuildContext context, Function(String) onChanged) {
  return TextField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          border: utilsloginOutlineInputBorder2(
              Theme.of(context).inputDecorationTheme.border.borderSide.color),
          filled: true,
          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
          //prefixIcon: _countryCodeText(context),
          hintText: 'Phone Number',
          hintStyle: TextStyle(
              color: Theme.of(context).inputDecorationTheme.hintStyle.color),
          enabledBorder: utilsloginOutlineInputBorder(Theme.of(context)
              .inputDecorationTheme
              .enabledBorder
              .borderSide
              .color)),
      onChanged: onChanged,
      style: utilsLoginInputTextStyle(screenWidth(context) * 0.06,
          Theme.of(context).inputDecorationTheme.labelStyle.color));
}
