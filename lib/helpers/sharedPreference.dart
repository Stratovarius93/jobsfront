import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future<bool> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("token", token);

    return true;
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }
}
