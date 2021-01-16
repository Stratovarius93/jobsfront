import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../view.dart' show StateMVC, App, FirstLog;
import 'package:hexcolor/hexcolor.dart';
import '../controller.dart' show verificarAuthCode;
import '../model.dart' show VerificarAuthResponse, VerificarNumeroResponse;

import 'package:form_validator/form_validator.dart';

class Registro extends StatefulWidget {
  const Registro({this.title, Key key}) : super(key: key);
  final String title;

  @override
  State createState() => _RegistroState();
}

class _RegistroState extends StateMVC<Registro> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _form.currentState.validate();
  }

  final validator1 = ValidationBuilder().maxLength(50).build();
  final validator2 = ValidationBuilder().maxLength(59).build();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Theme(
        data: App.themeData,
        child: Scaffold(
            body: Container(
                width: width,
                color: HexColor('#f5f5f5'),
                child: SingleChildScrollView(
                  child: Form(
                      key: _form,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            validator: validator1,
                            decoration: const InputDecoration(
                              hintText: 'Name',
                            ),
                          )
                        ],
                      )),
                ))));
  }
}
