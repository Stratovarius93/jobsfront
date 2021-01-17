import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../view.dart' show StateMVC;
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import '../controller.dart' show verificarAutenticador;
import '../model.dart' show VerificarAuthResponse, VerificarNumeroResponse;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPhoneNumber extends StatefulWidget {
  const LoginPhoneNumber({this.title, Key key}) : super(key: key);
  final String title;
  @override
  State createState() => _LoginPhoneNumber();
}

class _LoginPhoneNumber extends StateMVC<LoginPhoneNumber> {
  TextEditingController authController = new TextEditingController();

  Future<VerificarAuthResponse> _futureVerificarAuthResponse;

  Future<VerificarNumeroResponse> _futureVerificarNumeroResponse;

  final _formKey = GlobalKey<FormState>();

  final _authCodeKey = GlobalKey<FormState>();

  Country _selected;
  String countryCode = "1";
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      height: height,
      width: width,
      color: HexColor('#f5f5f5'),
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: height * .15),
            width: height * 0.4,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [Text("enter your Mobile Number")],
                  ),
                  Row(children: <Widget>[
                    CountryPicker(
                      showDialingCode: true,
                      showName: false,
                      onChanged: (Country country) {
                        setState(() {
                          _selected = country;
                          countryCode = _selected.dialingCode;
                        });
                      },
                      selectedCountry: _selected,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: authController,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '(819) 740-0000',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppLocalizations.of(context)
                                .enterPhoneNumber
                                .toString();
                          }
                          return null;
                        },
                      ),
                    ),
                  ]),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 500.0, bottom: 0.0),
                          child: ButtonTheme(
                            height: 1000,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      Size(500, 50)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          HexColor("#345e78"))),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    _futureVerificarAuthResponse =
                                        verificarAutenticador(
                                            authController.text, countryCode);
                                  });
                                  Navigator.pushNamed(context, '/authCode',
                                      arguments: {
                                        'futureVerificarAuthResponse':
                                            _futureVerificarAuthResponse,
                                        'auth': authController.text
                                      });
                                }
                              },
                              child: Text(AppLocalizations.of(context).next),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )),
    ));
  }
}
