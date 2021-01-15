import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../view.dart' show StateMVC;
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import '../controller.dart'
    show verificarAutenticador, firebaCloudMessaging_Listeners;
import '../model.dart' show VerificarAuthResponse, VerificarNumeroResponse;

class FirstLog extends StatefulWidget {
  const FirstLog({this.title, Key key}) : super(key: key);
  final String title;
  @override
  State createState() => _FirstLogState();
}

class _FirstLogState extends StateMVC<FirstLog> {
  TextEditingController authController = new TextEditingController();

  Future<VerificarAuthResponse> _futureVerificarAuthResponse;

  Future<VerificarNumeroResponse> _futureVerificarNumeroResponse;

  final _formKey = GlobalKey<FormState>();

  final _authCodeKey = GlobalKey<FormState>();

  final images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
  ];

  Country _selected;
  String countryCode = "1";
  @override
  void initState() {
    super.initState();
    firebaCloudMessaging_Listeners();
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
            color: Colors.transparent,
            margin: EdgeInsets.symmetric(vertical: height * .15),
            width: width * 0.8,
            height: width * 0.8,
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
            width: height * 0.4,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
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
                            return 'Please enter your number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ]),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50.0),
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
                              child: Text('Login'),
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
