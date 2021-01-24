import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model.dart';
import 'dart:async';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../view.dart' show CircularProgress;
import '../../helpers/appUrl.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

/*
Future<VerificarAuthResponse> verificarAutenticador(String auth) async {
  final json = {"aut": auth};
  print(json);
  final http.Response response = await http
      .post('http://142.182.33.56:5000/verificarAutenticador', body: json);

  if (response.statusCode == 200) {
    return VerificarAuthResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to verify your number');
  }
}
*/

Future<Object> verificarAutenticador(
    BuildContext context, String mobileNumber) async {
  final json = {"auth": ""};
  print(json);
  VerificarAuthResponse _futureVerificarAuthResponse;
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => (CircularProgress())));

  try {
    final http.Response response = await http
        .post(AppUrl.verificarAutenticador, body: json)
        .timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      _futureVerificarAuthResponse =
          VerificarAuthResponse.fromJson(jsonDecode(response.body));
    } else {
      Navigator.pop(context);
      throw Exception('Failed to verify your number');
    }
    print(_futureVerificarAuthResponse);
    print(_futureVerificarAuthResponse.message);
/* A changer le != */
    if (_futureVerificarAuthResponse.id == "") {
    } else {
      Navigator.pop(context);
      return Navigator.pushNamed(context, '/authCode', arguments: {
        'authId': _futureVerificarAuthResponse.id,
        'auth': mobileNumber
      });
    }
  } on TimeoutException {
    print('Timeout');
    Navigator.pop(context);
  } on Error catch (e) {
    print('Error $e');
    Navigator.pop(context);
  }
}

Future<Object> verificarAuthCode(BuildContext context, String auth, String code,
    String authenticationId) async {
  Map<String, String> deviceInfo = await getId();
  Position position = await determinePosition();
  final json = {
    "auth": auth,
    "authCode": code,
    "authenticationId": authenticationId,
    "deviceName": deviceInfo['deviceName'].toString(),
    "deviceId": deviceInfo["deviceId"].toString(),
    "location": position.latitude.toString() + position.altitude.toString(),
    "fireBaseToken": fireBaseToken
  };
  print(json);
  VerificarNumeroResponse _futureVerificarNumeroResponse;
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => (CircularProgress())));

  try {
    final http.Response response = await http
        .post(AppUrl.verificarNumero, body: json)
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      _futureVerificarNumeroResponse =
          VerificarNumeroResponse.fromJson(jsonDecode(response.body));
    } else {
      Navigator.pop(context);

      print(response.body.toString());
      throw Exception('Failed to verify your number');
    }
    if (_futureVerificarNumeroResponse.newUser == null) {
      Navigator.pop(context);
    } else if (_futureVerificarNumeroResponse.newUser == true) {
      Navigator.pop(context);
      Navigator.pushNamed(context, '/register', arguments: {
        'data': json,
        'authId': _futureVerificarNumeroResponse.authenticationId,
      });
    } else if (_futureVerificarNumeroResponse.newDevice == true) {
      Navigator.pop(context);
      Navigator.pushNamed(context, '/passwordVerification', arguments: {
        'data': json,
        'userId': _futureVerificarNumeroResponse.userId
      });
    } else if (_futureVerificarNumeroResponse.newDevice == false) {
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home',
          arguments: {'token': _futureVerificarNumeroResponse.token});
    }
  } on TimeoutException {
    print('timeout');
  } on Error catch (e) {
    print('Error $e');
  }
}

Future<Object> register(BuildContext context, String name, String lastName,
    String password, Map data) async {
  final json = {
    "password": password,
    "name": name,
    'lastName': lastName,
    "authenticationId": data['authenticationId'],
    "deviceName": data["deviceName"],
    "deviceId": data["deviceId"],
    "location": data["location"],
    "fireBaseToken": data["fireBaseToken"]
  };
  print(json);
  RegisterResponse _futureRegisterResponse;
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => (CircularProgress())));

  try {
    final http.Response response = await http
        .post(AppUrl.registro, body: json)
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      _futureRegisterResponse =
          RegisterResponse.fromJson(jsonDecode(response.body));
    } else {
      Navigator.pop(context);

      print(response.body.toString());
      throw Exception('Failed to verify your number');
    }
    if (_futureRegisterResponse.token == null) {
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
      /* crear skills */
      Navigator.pushNamed(context, '/skills', arguments: {});
    }
  } on TimeoutException {
    print('timeout');
  } on Error catch (e) {
    print('Error $e');
  }
}

Future<Object> passwordVerification(
    BuildContext context, String userId, String password, Map data) async {
  final json = {
    "password": password,
    "userId": userId,
    "authId": data['authenticationId'],
    "deviceName": data["deviceName"],
    "deviceId": data["deviceId"],
    "location": data["location"],
    "fireBaseToken": data["fireBaseToken"]
  };
  print(json);
  PasswordVerificationResponse _futurePasswordVerificationResponse;
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => (CircularProgress())));

  try {
    final http.Response response = await http
        .post(AppUrl.passwordVerification, body: json)
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      _futurePasswordVerificationResponse =
          PasswordVerificationResponse.fromJson(jsonDecode(response.body));
    } else {
      Navigator.pop(context);

      print(response.body.toString());
      throw Exception('Failed to verify your number');
    }
    if (_futurePasswordVerificationResponse.token == null) {
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
      /* crear home y arreglar lo del token y todo eso */
      Navigator.pushNamed(context, '/home', arguments: {});
    }
  } on TimeoutException {
    print('timeout');
  } on Error catch (e) {
    print('Error $e');
  }
}

Future<Map<String, String>> getId() async {
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

Future<Position> determinePosition() async {
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
