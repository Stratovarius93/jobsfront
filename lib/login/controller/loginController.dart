import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model.dart' show VerificarAuthResponse, VerificarNumeroResponse;
import 'dart:async';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

Future<VerificarAuthResponse> verificarAutenticador(
    String auth, String countryCode) async {
  final json = {"auth": "+" + countryCode + auth};
  print(json);
  final http.Response response = await http
      .post('http://192.168.2.21:5000/verificarAutenticador', body: json);

  if (response.statusCode == 200) {
    return VerificarAuthResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to verify your number');
  }
}

Future<VerificarNumeroResponse> verificarAuthCode(
    String auth, String code, String authenticationId) async {
  Map<String, String> deviceInfo = await _getId();
  Position position = await _determinePosition();
  final json = {
    "auth": auth,
    "authCode": code,
    "authenticationId": authenticationId,
    "deviceName": deviceInfo['deviceName'].toString(),
    "macAddress": deviceInfo["deviceId"].toString(),
    "location": position.latitude.toString() + position.altitude.toString(),
    "fireBaseToken": fireBaseToken
  };
  print(json.toString());

  final http.Response response =
      await http.post('http://192.168.2.21:5000/verificarNumero', body: json);

  if (response.statusCode == 200) {
    return VerificarNumeroResponse.fromJson(jsonDecode(response.body));
  } else {
    print(response.toString());
    throw Exception('Failed to verify your number');
  }
}

Future<Map<String, String>> _getId() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  if (kIsWeb) {
    var webInfo = await deviceInfoPlugin.webBrowserInfo;
    return <String, String>{
      'deviceName': describeEnum(webInfo.browserName),
      'deviceId': webInfo.vendor +
          webInfo.userAgent +
          webInfo.hardwareConcurrency.toString()
    };
  } else if (Platform.isAndroid) {
    var androidInfo = await deviceInfoPlugin.androidInfo;
    return <String, String>{
      'deviceName': androidInfo.device,
      'deviceId': androidInfo.androidId
    };
  } else if (Platform.isIOS) {
    var iosInfo = await deviceInfoPlugin.iosInfo;
    return <String, String>{
      'deviceName': iosInfo.name,
      'deviceId': iosInfo.identifierForVendor
    };
  }
  return <String, String>{'deviceName': "Unknown", 'deviceId': "Unknown"};
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permently denied, we cannot request permissions');
  }

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      return Future.error(
          'Location permission are denied (actual value $permission).');
    }
  }
  return await Geolocator.getCurrentPosition();
}

String fireBaseToken;

void firebaCloudMessaging_Listeners() {
  if (Platform.isIOS) iOSPermissions();

  _firebaseMessaging.getToken().then((token) {
    print(token);
    fireBaseToken = token;
  });
  _firebaseMessaging.configure(
    onMessage: (Map<String, dynamic> message) async {
      print('on message $message');
    },
    onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
    },
    onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
    },
  );
}

void iOSPermissions() {
  _firebaseMessaging.requestNotificationPermissions(
      IosNotificationSettings(sound: true, badge: true, alert: true));
  _firebaseMessaging.onIosSettingsRegistered
      .listen((IosNotificationSettings setting) {
    print(setting);
  });
}
