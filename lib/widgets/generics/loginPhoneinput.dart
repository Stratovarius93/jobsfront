import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/utils/input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenericInputPhone extends StatefulWidget {
  @override
  _GenericInputPhoneState createState() => _GenericInputPhoneState();
}

class _GenericInputPhoneState extends State<GenericInputPhone> {
  String _selectedCountryCode;
  List<String> _countryCodes = ['+91', '+23'];

  @override
  Widget build(BuildContext context) {
    var countryDropDown = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))),
      height: 45.0,
      margin: EdgeInsets.all(3.0),
      //width: 300.0,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            value: _selectedCountryCode,
            items: _countryCodes.map((String value) {
              return DropdownMenuItem(
                  value: value,
                  child: Text(value,
                      style: utilsLoginInputTextStyle(
                          screenWidth(context) * 0.06)));
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCountryCode = value;
              });
            },
          ),
        ),
      ),
    );
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 3.0),
      child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              border: utilsloginOutlineInputBorder2,
              filled: true,
              fillColor: colorFillInput,
              prefixIcon: countryDropDown,
              hintText: 'Phone Number',
              hintStyle: TextStyle(color: colorTextSubTitle),
              enabledBorder: utilsloginOutlineInputBorder),
          onChanged: (value) {},
          style: utilsLoginInputTextStyle(screenWidth(context) * 0.06)),
    );
  }
}
