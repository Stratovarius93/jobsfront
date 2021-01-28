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
          internalCode: json['error']['internalCode'],
          id: "");
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
      print('1');
      return VerificarNumeroResponse(
        newUser: null,
        message: json['error']['message'],
        status: json['error']['status'],
        internalCode: json['error']['internalCode'],
      );
    } else if (json['response']['data'].containsKey("token")) {
      print('2');
      return VerificarNumeroResponse(
        newUser: json['response']['data']['newUser'],
        newDevice: json['response']['data']['newDevice'],
        token: json['response']['data']['token'],
      );
    } else if (json['response']['data'].containsKey('userId')) {
      print('3');
      print(json['response']['data']['newUser']);

      return VerificarNumeroResponse(
          newUser: json['response']['data']['newUser'],
          newDevice: json['response']['data']['newDevice'],
          userId: json['response']['data']['userId']);
    } else {
      print('4');
      return VerificarNumeroResponse(
          newUser: json['response']['data']['newUser'],
          authenticationId: json['response']['data']['authenticationId']);
    }
  }
}

class RegisterResponse {
  final String message;
  final String status;
  final String internalCode;
  final String token;

  RegisterResponse({this.message, this.status, this.internalCode, this.token});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('error')) {
      return RegisterResponse(
        message: json['error']['message'],
        status: json['error']['status'],
        internalCode: json['error']['internalCode'],
        token: null,
      );
    } else {
      return RegisterResponse(
          message: json['response']['message']['message1'],
          token: json['response']['data']['token']);
    }
  }
}
/*
    esta funcion registra el usuario. 
    si el numero del usuario ya ha sido utilizado por otro usuario, una notificacion al otro usuario es enviada y todas sus sessiones son cerradas en 24h

    parametros:{"password" : "dansan00", "authId" : "ejlks857fger", "name" : " pepito", "lastName" : "perez",
                "deviceId" : "deviceId" , "deviceName" : "iphone", "fireBasetoken" : "1rkpr65ver", "location" : "12165.16513" }

    return : token : el token contiene el id de la session y el id del usuario
    el usuario tendra que elegir las skills antes de ingresar 
    */

/*
            return {"response" : {"message" : {"message1" : 'Successfully created your account.'}}, "data" : {"token" : token}}
        except:
            return {"error" :{"message" : "here was an error while trying to create your account", "status" : "400", "internalCode" : "1000"}}
     */

class PasswordVerificationResponse {
  final String message;
  final String status;
  final String internalCode;
  final String token;

  PasswordVerificationResponse(
      {this.message, this.status, this.internalCode, this.token});

  factory PasswordVerificationResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('error')) {
      return PasswordVerificationResponse(
        message: json['error']['message'],
        status: json['error']['status'],
        internalCode: json['error']['internalCode'],
        token: null,
      );
    } else {
      return PasswordVerificationResponse(
          message: json['response']['message']['message1'],
          token: json['response']['data']['token']);
    }
  }
}

/*
    esta funcion verifica la contrasena del usuario y crea una nueva session.
    parametros: {"password" : "dansan00", "userId" : "dddeg56", "authId"
                "deviceId" : "1c:4d:70:df:9e:22" , "deviceName" : "iphone", "fireBasetoken" : "1rkpr65ver" }


    return : token : el token contiene el user id y la sesssion id 


            return {"response": {"message" : { "message1" :  "correct password"}}, "data" : { "token" : token}}
        return {"error" :{"message" : "An error has ocurred", "status" : "400", "internalCode" : "1000"}}
       
    */
