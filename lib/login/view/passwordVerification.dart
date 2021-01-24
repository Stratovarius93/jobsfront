import 'package:flutter/material.dart';
import 'package:jobs_front/login/controller.dart';
import '../../theme/mainTheme.dart' show loginButton, inputDecoration;
import '../view.dart' show StateMVC, App, backArrow;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordVerification extends StatefulWidget {
  const PasswordVerification({this.title, Key key}) : super(key: key);
  final String title;

  @override
  State createState() => _PasswordVerification();
}

class _PasswordVerification extends StateMVC<PasswordVerification> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  String password;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final Map<String, Object> response =
        ModalRoute.of(context).settings.arguments;

    final Map<String, Object> data = response['data'];

    final String userId = response['userId'];

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
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30.0, vertical: 8),
                                    child: Text(
                                      AppLocalizations.of(context).pleaseEnter +
                                          AppLocalizations.of(context).password,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(height: height * 0.10),
                                  passwordField,
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
                    _formKey.currentState.save();
                    print(' password $password ');
                    if (_formKey.currentState.validate()) {
                      passwordVerification(context, userId, password, data);
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
}
