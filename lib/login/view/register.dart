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
  }

  TextEditingController nameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Theme(
        data: App.themeData,
        child: Scaffold(
            body: Container(
                width: width,
                height: height,
                color: HexColor('#f5f5f5'),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Container(
                          margin: EdgeInsets.symmetric(vertical: height * .15),
                          width: height * 0.3,
                          child: Form(
                              key: _form,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                        labelText: 'Name',
                                        prefixIcon: Icon(Icons.person)),
                                  ),
                                  TextFormField(
                                    controller: lastNameController,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      labelText: 'LastName',
                                    ),
                                  ),
                                  TextFormField(
                                    controller: passwordController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter the code';
                                      } else if (value !=
                                          confirmPasswordController.text) {
                                        return 'Your password did not match';
                                      }
                                      return null;
                                    },
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.lock_outline),
                                        labelText: 'Password'),
                                  ),
                                  TextFormField(
                                    controller: confirmPasswordController,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Confirm password',
                                      prefixIcon: Icon(Icons.lock_outline),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 50.0),
                                    child: ButtonTheme(
                                      height: 1000,
                                      child: ElevatedButton(
                                        child: Text('Register'),
                                        onPressed: () {
                                          if (_form.currentState.validate()) {
                                            setState(() {});
                                          }
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ))),
                    ])))));
  }
}
