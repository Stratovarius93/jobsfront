import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../view.dart' show StateMVC, FirstLog;

class Login extends StatefulWidget {
  const Login({this.title, Key key}) : super(key: key);

  final String title;
  @override
  State createState() => _LoginState();
}

class _LoginState extends StateMVC<Login> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                color: Colors.black,
                icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (BuildContext _) =>
                          InheritedTheme.captureAll(context, FirstLog())));
                },
              );
            },
          )),
      body: Container(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: height * 0.2,
              child: const Text('Enter Your mobile number'),
            ),
            Container(
                width: height * 0.2,
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
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
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Next'),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
