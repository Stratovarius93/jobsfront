import 'dart:async';
import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/generated/l10n.dart';
import 'package:AppWork/widgets/generics/backArrow.dart';
import 'package:AppWork/widgets/generics/loginPhoneinput.dart';
import 'package:AppWork/widgets/generics/loginSubtitle.dart';
import 'package:AppWork/widgets/generics/loginTitle.dart';
import 'package:AppWork/widgets/generics/primaryButton.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';

String _phonenumber;
String _codePhone = '+1';
//final _codeStream = StreamController<String>.broadcast();
var _codeStream;

class LoginPage3 extends StatefulWidget {
  @override
  _LoginPage3State createState() => _LoginPage3State();
}

class _LoginPage3State extends State<LoginPage3> {
  @override
  void initState() {
    super.initState();
    _codeStream = StreamController<String>.broadcast();
  }

  @override
  void dispose() {
    _codeStream?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Theme.of(context).brightness,
          statusBarIconBrightness: Theme.of(context).brightness),
      child: Scaffold(
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GenericLoginTitle(
                          title: S.current.page2User,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Icon(
                          Ionicons.person_outline,
                          color: Theme.of(context).textTheme.headline6.color,
                          size: screenWidth(context) * 0.2,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GenericLoginSubTitle(title: S.current.page3SubTile),
                        SizedBox(
                          height: 32,
                        ),
                        StreamBuilder(
                          stream: _codeStream.stream,
                          builder: (BuildContext context,
                              AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              _codePhone = snapshot.data;
                              return GenericInputPhone(
                                onchanged1: () {
                                  _selectCountry(context);
                                },
                                code: '+ ${snapshot.data}',
                                onchanged2: (value) {
                                  _phonenumber = value;
                                },
                              );
                            } else {
                              return GenericInputPhone(
                                onchanged1: () {
                                  _selectCountry(context);
                                },
                                code: _codePhone,
                                onchanged2: (value) {
                                  print(value);
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        GenericPrimaryButton(
                          title: S.current.page3Button,
                          onPressed: () {
                            print('+ $_codePhone $_phonenumber');
                            Navigator.pushReplacementNamed(
                                context, 'loginPage4');
                          },
                        )
                      ],
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: BackArrow(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'loginPage2');
                //Navigator.pop(context);
                _codeStream.close();
              },
            ),
          ),
        ]),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}

void _selectCountry(BuildContext context) {
  showCountryPicker(
    context: context,
    showPhoneCode: true, // optional. Shows phone code before the country name.
    onSelect: (Country country) {
      //print('Select country: ${country.displayName}');
      _codeStream.sink.add(country.phoneCode);
    },
  );
}
