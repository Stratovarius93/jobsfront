import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../view.dart' show StateMVC, Login;
import 'package:hexcolor/hexcolor.dart';

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
    final images = [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
    ];
    return Scaffold(
        body: Container(
      height: height,
      width: width,
      color: HexColor('#f5f5f5'),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      return 'Please enter your number';
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    ));
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
