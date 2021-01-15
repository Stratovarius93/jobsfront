import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../view.dart' show StateMVC, App, FirstLog;
import 'package:hexcolor/hexcolor.dart';
import '../controller.dart' show verificarAuthCode;
import '../model.dart' show VerificarAuthResponse, VerificarNumeroResponse;

class Registro extends StatefulWidget {
  const Registro({this.title, Key key}) : super(key: key);
  final String title;

  @override
  State createState() => _RegistroState();
}

class _RegistroState extends StateMVC<Registro> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Theme(
        data: App.themeData,
        child: Scaffold(
            body: Container(
                width: width,
                color: HexColor('#f5f5f5'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Form()],
                ))));
  }
}
