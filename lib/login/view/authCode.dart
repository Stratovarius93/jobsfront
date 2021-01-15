import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../view.dart' show StateMVC, App, FirstLog;
import 'package:hexcolor/hexcolor.dart';
import '../controller.dart' show verificarAuthCode;
import '../model.dart' show VerificarAuthResponse, VerificarNumeroResponse;

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

  Future<VerificarNumeroResponse> _futureVerificarNumeroResponse;

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> response =
        ModalRoute.of(context).settings.arguments;

    final Future<VerificarAuthResponse> futureVerificarAuthResponse =
        response['futureVerificarAuthResponse'];

    final String auth = response['auth'];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Theme(
        data: App.themeData,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: HexColor('#f5f5f5'),
                shadowColor: Colors.transparent,
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      color: Colors.blue,
                      icon: Icon(Icons.arrow_back_ios_rounded),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                )),
            body: Container(
                height: height,
                width: width,
                color: HexColor('#f5f5f5'),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      FutureBuilder<VerificarAuthResponse>(
                          future: futureVerificarAuthResponse,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data.id != null) {
                                print('chao');
                                return Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: height * .15),
                                    width: height * 0.3,
                                    child: Form(
                                        key: _authCodeKey,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              TextFormField(
                                                onTap: () {},
                                                controller: authCodeController,
                                                inputFormatters: <
                                                    TextInputFormatter>[
                                                  FilteringTextInputFormatter
                                                      .digitsOnly
                                                ],
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: '0 0 0 0',
                                                ),
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'Please enter the code';
                                                  }
                                                  return null;
                                                },
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 16.0),
                                                child: ButtonTheme(
                                                  height: 1000,
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        minimumSize:
                                                            MaterialStateProperty
                                                                .all<Size>(Size(
                                                                    500, 50)),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    HexColor(
                                                                        "#345e78"))),
                                                    onPressed: () {
                                                      if (_authCodeKey
                                                          .currentState
                                                          .validate()) {
                                                        setState(() {
                                                          _futureVerificarNumeroResponse =
                                                              verificarAuthCode(
                                                            auth,
                                                            authCodeController
                                                                .text,
                                                            snapshot.data.id,
                                                          );
                                                        });
                                                      }
                                                    },
                                                    child: Text('Login'),
                                                  ),
                                                ),
                                              ),
                                            ])));
                              } else {
                                return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Text(snapshot.data.toString()),
                                      )
                                    ]);
                              }
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return CircularProgressIndicator();
                          })
                    ])))));
  }
}
