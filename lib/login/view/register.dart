import 'package:flutter/material.dart';
import 'package:jobs_front/login/controller.dart';
import '../../theme/mainTheme.dart' show loginButton, inputDecoration;
import '../view.dart' show StateMVC, App, backArrow;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Register extends StatefulWidget {
  const Register({this.title, Key key}) : super(key: key);
  final String title;

  @override
  State createState() => _RegistroState();
}

class _RegistroState extends StateMVC<Register> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  String name, lastName, password, confirmPassword;

  bool agreedTC = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final Map<String, Object> response =
        ModalRoute.of(context).settings.arguments;

    final Map<String, Object> data = response['data'];

    final String authId = response['authId'];

    final nameField = TextFormField(
        onSaved: (value) => name = value,
        decoration: inputDecoration(
          Icons.person,
          AppLocalizations.of(context).name,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return AppLocalizations.of(context).pleaseEnter +
                AppLocalizations.of(context).name.toLowerCase();
          }
          return null;
        });

    final lastNameField = TextFormField(
      onSaved: (value) => lastName = value,
      validator: (value) {
        if (value.isEmpty) {
          return AppLocalizations.of(context).pleaseEnter +
              AppLocalizations.of(context).lastName.toLowerCase();
        }
        return null;
      },
      decoration: inputDecoration(
        Icons.person,
        AppLocalizations.of(context).lastName,
      ),
    );

    final passwordField = TextFormField(
      onSaved: (value) => password = value,
      validator: (value) {
        if (value.isEmpty) {
          return AppLocalizations.of(context).pleaseEnter +
              AppLocalizations.of(context).password.toLowerCase();
        }
        return null;
      },
      obscureText: true,
      decoration: inputDecoration(
        Icons.lock_outline,
        AppLocalizations.of(context).password,
      ),
    );

    final confirmPasswordFeield = TextFormField(
      onSaved: (value) => confirmPassword = value,
      validator: (value) {
        if (value.isEmpty) {
          return AppLocalizations.of(context).pleaseEnter +
              AppLocalizations.of(context).confirmPassword.toLowerCase();
        } else if (value != password) {
          return AppLocalizations.of(context).doNotMatch;
        }
        return null;
      },
      obscureText: true,
      decoration: inputDecoration(
        Icons.lock_outline,
        AppLocalizations.of(context).confirmPassword,
      ),
    );

    final checkBox = Row(children: [
      Checkbox(value: agreedTC, onChanged: _setAgreedTC),
      GestureDetector(
          onTap: () => _setAgreedTC(!agreedTC),
          child: Text(AppLocalizations.of(context).agreeTerms))
    ]);

    return Theme(
        data: App.themeData,
        child: Scaffold(
            appBar: backArrow(context),
            body: Container(
                width: width,
                height: height,
                color: Theme.of(context).backgroundColor,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Container(
                          margin: EdgeInsets.symmetric(vertical: height * .05),
                          width: width * .8,
                          child: Form(
                              key: _form,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30.0, vertical: 8),
                                    child: Text(
                                      AppLocalizations.of(context).register,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(height: height * 0.05),
                                  nameField,
                                  SizedBox(height: height * 0.05),
                                  lastNameField,
                                  SizedBox(height: height * 0.05),
                                  passwordField,
                                  SizedBox(height: height * 0.05),
                                  confirmPasswordFeield,
                                  SizedBox(
                                    height: height * 0.05,
                                  ),
                                  checkBox,
                                ],
                              ))),
                    ]))),
            bottomNavigationBar: Container(
              color: Theme.of(context).backgroundColor,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: height * 0.05,
                    left: width * 0.05,
                    right: width * 0.05),
                child: ElevatedButton(
                  style: loginButton(),
                  onPressed: () {
                    _form.currentState.save();
                    if (_form.currentState.validate() && agreedTC == true) {
                      register(context, name, lastName, password, data);
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
            )));
  }

  void _setAgreedTC(bool newValue) {
    setState(() {
      agreedTC = newValue;
    });
  }
}
