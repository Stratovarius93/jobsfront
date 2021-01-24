import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../view.dart' show StateMVC, App;

import '../controller.dart' show verificarAutenticador;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../theme/mainTheme.dart' show loginButton;

class LoginPhoneNumber extends StatefulWidget {
  const LoginPhoneNumber({this.title, Key key}) : super(key: key);
  final String title;
  @override
  State createState() => _LoginPhoneNumber();
}

String mobileNumber = "";
PhoneNumber number = PhoneNumber(isoCode: 'CA');

class _LoginPhoneNumber extends StateMVC<LoginPhoneNumber> {
  TextEditingController authController = new TextEditingController();
  TextEditingController auth2Controller = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Theme(
        data: App.themeData,
        child: Scaffold(
          body: Container(
            height: height,
            width: width,
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.8,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * 0.2),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 20),
                            child: Text(
                                AppLocalizations.of(context)
                                    .enterPhoneNumber
                                    .toString(),
                                style: Theme.of(context).textTheme.headline6,
                                textAlign: TextAlign.center)),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            mobileNumber = number.toString();
                          },
                          selectorConfig: SelectorConfig(
                            setSelectorButtonAsPrefixIcon: true,
                            useEmoji: true,
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          errorMessage: AppLocalizations.of(context)
                              .pleaseEnterPhoneNumber
                              .toString(),
                          hintText: AppLocalizations.of(context)
                              .phoneNumber
                              .toString(),
                          spaceBetweenSelectorAndTextField: 0,
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          initialValue: number,
                          textFieldController: authController,
                          formatInput: true,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          onSaved: (PhoneNumber number) {},
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                bottom: height * 0.05, left: width * 0.05, right: width * 0.05),
            child: ElevatedButton(
              style: loginButton(),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  verificarAutenticador(context, mobileNumber);
                }
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    Text(
                      AppLocalizations.of(context).next,
                    ),
                    Icon(Icons.arrow_forward_ios_outlined)
                  ]),
            ),
          ),
        ));
  }
}
