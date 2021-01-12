import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../view.dart' show StateMVC, Login;

import 'package:hexcolor/hexcolor.dart';
import '../controller.dart' show verificarAutenticador, verificarAuthCode;
import '../model.dart' show VerificarAuthResponse, VerificarNumeroResponse;

class FirstLog extends StatefulWidget {
  const FirstLog({this.title, Key key}) : super(key: key);
  final String title;
  @override
  State createState() => _FirstLogState();
}

class _FirstLogState extends StateMVC<FirstLog> {
  TextEditingController authController = new TextEditingController();

  TextEditingController authCodeController = new TextEditingController();

  Future<VerificarAuthResponse> _futureVerificarAuthResponse;

  Future<VerificarNumeroResponse> _futureVerificarNumeroResponse;

  final _formKey = GlobalKey<FormState>();

  final _authCodeKey = GlobalKey<FormState>();

  final images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
  ];

  String uniqueId = "Unknown";

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
            child: (_futureVerificarAuthResponse == null)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.symmetric(vertical: height * .15),
                          width: height * 0.4,
                          height: height * 0.4,
                          child: new Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return ClipRRect(
                                  clipBehavior: Clip.antiAlias,
                                  borderRadius: BorderRadius.circular(35),
                                  child: Image.asset(
                                    images[index],
                                    fit: BoxFit.fill,
                                  ),
                                );
                              },
                              itemCount: images.length,
                              scale: 0.8,
                              autoplay: true,
                              autoplayDelay: 10000,
                              duration: 500),
                        ),
                        Container(
                            width: height * 0.2,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  TextFormField(
                                    controller: authController,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: '(819) 740-0000',
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter your number';
                                      }
                                      return null;
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: ButtonTheme(
                                      height: 1000,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            minimumSize:
                                                MaterialStateProperty.all<Size>(
                                                    Size(500, 50)),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    HexColor("#345e78"))),
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            setState(() {
                                              _futureVerificarAuthResponse =
                                                  verificarAutenticador(
                                                      authController.text);
                                            });
                                          }
                                        },
                                        child: Text('Login'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ])
                : FutureBuilder<VerificarAuthResponse>(
                    future: _futureVerificarAuthResponse,
                    builder: (context, snapshot) {
                      print(_futureVerificarAuthResponse.toString());

                      if (snapshot.hasData) {
                        print('buneo');
                        if (snapshot.data.id != null) {
                          print('chao');
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppBar(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  leading: Builder(
                                    builder: (BuildContext context) {
                                      return IconButton(
                                        color: Colors.blue,
                                        icon:
                                            Icon(Icons.arrow_back_ios_rounded),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute<void>(
                                                  builder: (BuildContext _) =>
                                                      InheritedTheme.captureAll(
                                                          context,
                                                          FirstLog())));
                                        },
                                      );
                                    },
                                  )),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: height * .15),
                                  width: height * 0.2,
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
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
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
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16.0),
                                            child: ButtonTheme(
                                              height: 1000,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                    minimumSize:
                                                        MaterialStateProperty
                                                            .all<Size>(
                                                                Size(500, 50)),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(HexColor(
                                                                "#345e78"))),
                                                onPressed: () {
                                                  if (_authCodeKey.currentState
                                                      .validate()) {
                                                    setState(() {
                                                      _futureVerificarNumeroResponse =
                                                          verificarAuthCode(
                                                        authController.text,
                                                        authCodeController.text,
                                                        snapshot.data.id,
                                                      );
                                                    });
                                                  }
                                                },
                                                child: Text('Login'),
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ))
                            ],
                          );
                        } else {
                          print('hola');
                        }
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    }),
          )),
    );
  }
}
