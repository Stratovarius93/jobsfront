import '../view.dart';

class VerificarAuthResponse {
  final String message;
  final String status;
  final String internalCode;
  final String id;

  VerificarAuthResponse(
      {this.message, this.status, this.internalCode, this.id});

  factory VerificarAuthResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('error')) {
      return VerificarAuthResponse(
          message: json['error']['message'],
          status: json['error']['status'],
          internalCode: json['error']['internalCode']);
    } else {
      return VerificarAuthResponse(
          id: json['response']['data']['authenticationId']);
    }
  }
}

/*
return {"response" : {"data" : { "newUser" : newUser, "userId" : userId, "newDevice": newDevice}}}

return {"error" :{"message" : "The code you inputed is incorrect.", "status" : "400", "internalCode" : "1000"}}

return {"response" : { "data" : { "newUser" : newUser, "authenticationId" : authenticationId}}}

return {"response" : { "data" : {"newUser" : newUser, "token" : token, "newDevice": newDevice}}}

*/

class VerificarNumeroResponse {
  final String message;
  final String status;
  final bool newUser;
  final bool newDevice;
  final String userId;
  final String internalCode;
  final String authenticationId;
  final String token;

  VerificarNumeroResponse(
      {this.message,
      this.status,
      this.newUser,
      this.newDevice,
      this.userId,
      this.internalCode,
      this.authenticationId,
      this.token});

  factory VerificarNumeroResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('error')) {
      return VerificarNumeroResponse(
        message: json['error']['message'],
        status: json['error']['status'],
        internalCode: json['error']['internalCode'],
      );
    } else if (json['response']['data'].containsKey("token")) {
      return VerificarNumeroResponse(
        newUser: json['response']['data']['newUser'],
        newDevice: json['response']['data']['newDevice'],
        token: json['response']['data']['token'],
      );
    } else if (json['response']['data'].containsKey('userId')) {
      return VerificarNumeroResponse(
          newUser: json['response']['data']['newUser'],
          newDevice: json['response']['data']['newDevice'],
          userId: json['response']['data']['newDevice']);
    } else {
      return VerificarNumeroResponse(
          newUser: json['response']['data']['newUser'],
          authenticationId: json['response']['data']['authenticationId']);
    }
  }
}
