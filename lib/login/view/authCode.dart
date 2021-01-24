import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../view.dart' show StateMVC, App;
import 'package:hexcolor/hexcolor.dart';
import '../controller.dart' show verificarAuthCode;

import '../../theme/mainTheme.dart' show loginButton;

class AuthCode extends StatefulWidget {
  const AuthCode({this.title, Key key}) : super(key: key);
  final String title;
  @override
  State createState() => _AuthCodeState();
}

class _AuthCodeState extends StateMVC<AuthCode> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController authCodeController = new TextEditingController();

  final _authCodeKey = GlobalKey<FormState>();

  String code = "";
  @override
  Widget build(BuildContext context) {
    final Map<String, Object> response =
        ModalRoute.of(context).settings.arguments;

    final String auth = response['auth'];

    final String authId = response['authId'];

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Theme(
        data: App.themeData,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).backgroundColor,
                shadowColor: Colors.transparent,
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                )),
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
                    if (_authCodeKey.currentState.validate()) {
                      print("el numero $auth y el codigo $code");

                      verificarAuthCode(
                        context,
                        auth,
                        code,
                        authId,
                      );
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
            ),
            body: Container(
                height: height,
                width: width,
                color: Theme.of(context).backgroundColor,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      SizedBox(height: height * 0.1),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                        child: Text(
                          AppLocalizations.of(context).phoneNumberVerification,
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                        child: RichText(
                          text: TextSpan(
                            text: AppLocalizations.of(context).enterSentCode,
                            children: [
                              TextSpan(
                                  text: auth,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ))
                            ],
                            style:
                                (TextStyle(fontSize: 15, color: Colors.black)),
                          ),
                        ),
                      ),
                      Container(
                          width: width * 0.8,
                          margin: EdgeInsets.symmetric(vertical: height * .05),
                          child: Form(
                              key: _authCodeKey,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    PinCodeTextField(
                                      pinTheme: PinTheme(
                                          activeColor:
                                              Theme.of(context).primaryColor,
                                          selectedColor: HexColor('#000000'),
                                          inactiveColor:
                                              Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      animationType: AnimationType.fade,
                                      keyboardType: TextInputType.number,
                                      backgroundColor:
                                          Theme.of(context).backgroundColor,
                                      cursorColor:
                                          Theme.of(context).primaryColor,
                                      appContext: context,
                                      length: 6,
                                      onChanged: (value) {
                                        print(value);
                                        setState(() {
                                          code = value;
                                        });
                                      },
                                      validator: (v) {
                                        if (v.length != 6) {
                                          return AppLocalizations.of(context)
                                              .enterCode
                                              .toString();
                                        } else {
                                          return null;
                                        }
                                      },
                                    )
                                  ])))
                    ])))));
  }
}
