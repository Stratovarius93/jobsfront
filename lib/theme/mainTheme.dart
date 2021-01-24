import '../login/controller.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData mainTheme() {
  return ThemeData(
      bottomAppBarColor: Colors.red,
      backgroundColor: HexColor("#f2f2f2"),
      primaryColor: HexColor("#515f76"),
      accentColor: Colors.green,
      textTheme: TextTheme(
        bodyText2: TextStyle(color: Colors.black),
        headline2: TextStyle(
          color: HexColor("#515f76"),
        ),
        headline6: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ));
}

ButtonStyle loginButton() {
  return ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 20)),
      minimumSize: MaterialStateProperty.all<Size>(Size(1000, 55)),
      backgroundColor: MaterialStateProperty.all<Color>(HexColor("#515f76")),
      shape: MaterialStateProperty.all<OutlinedBorder>(
          new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      shadowColor: MaterialStateProperty.all<Color>(HexColor('#979797')),
      elevation: MaterialStateProperty.all<double>(5));
}

InputDecoration inputDecoration(IconData emoji, String texte) {
  return InputDecoration(labelText: texte, prefixIcon: Icon(emoji));
}
