import 'package:flutter/material.dart';

import '../view.dart' show StateMVC, Login;

class FirstLog extends StatefulWidget {
  const FirstLog({this.title, Key key}) : super(key: key);
  final String title;
  @override
  State createState() => _FirstLogState();
}

class _FirstLogState extends StateMVC<FirstLog> {
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: height * .15),
                width: height * 0.5,
                height: height * 0.5,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: height * 0.5,
                      color: Colors.blue,
                    ),
                    Container(
                      width: height * 0.5,
                      color: Colors.red,
                    ),
                    Container(
                      width: height * 0.5,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              RaisedButton(
                  onPressed: () {
                    _firtsLogin(context);
                  },
                  child: const Text('Login', style: TextStyle(fontSize: 20))),
            ],
          ),
        ),
      ),
    );
  }
}

void _firtsLogin(context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (BuildContext bc) {
        return Container(
          height: height * 0.3,
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                  leading: new Icon(Icons.account_circle),
                  title: new Text('Use another account'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (BuildContext _) =>
                            InheritedTheme.captureAll(context, Login())));
                  }),
            ],
          ),
        );
      });
}
