import 'package:AppWork/constants/colors.dart';
import 'package:AppWork/constants/fonts.dart';
import 'package:AppWork/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pin_put/pin_put.dart';

class GenericPinInput extends StatefulWidget {
  @override
  GenericPinInputState createState() => GenericPinInputState();
}

class GenericPinInputState extends State<GenericPinInput> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: colorTextSubTitle),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PinPut(
      fieldsCount: 5,
      onSubmit: (String pin) => _validate(pin),
      textStyle: GoogleFonts.getFont(fontApp,
          textStyle: TextStyle(
              color: colorPrimaryButton,
              fontSize: screenWidth(context) * 0.08,
              fontFamily: fontApp,
              fontWeight: FontWeight.w500)),
      focusNode: _pinPutFocusNode,
      controller: _pinPutController,
      submittedFieldDecoration: _pinPutDecoration.copyWith(
          borderRadius: BorderRadius.circular(20.0), color: Colors.white),
      selectedFieldDecoration: _pinPutDecoration,
      followingFieldDecoration: _pinPutDecoration.copyWith(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        border: Border.all(
          color: colorTextSubTitle,
        ),
      ),
    );
  }

  void _validate(String pin) {
    print(pin);
  }
}
