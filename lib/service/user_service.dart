import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../classes/user.dart';
import '../dto/response_dto.dart';
import 'package:http/http.dart' as http;

/// Clase para realizar solicitudes REST a Backend en cuanto a usuarios
class UserService {
  //Direccion URL del servidor backend
  static const String backendUrl = "http://192.168.0.2:7777";

  /// Metodo para registrar un usuario en la base de datos
  static Future<ResponseDto> register(User user) async {
    ResponseDto response;
    //Establecemos la uri para la invocacion
    var uri = Uri.parse("$backendUrl/api/v1/user");
    //Convertimos el objeto User a un JSON
    var body = jsonEncode(user.toJson());

    //Establecemos el Content-Type y Accept en las cabeceras
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    //Realizamos la invocacion al servidor backend
    var responseHttp = await http.post(uri, headers: headers, body: body);

    if (responseHttp.statusCode == 200) {
      response = ResponseDto.fromJson(jsonDecode(responseHttp.body));
      print(response);
    } else {
      throw Exception("Error al intentar registrar al usuario");
    }
    return response;
  }

  ///Método para realizar el cambio de contraseña
  static Future<ResponseDto> updatePass(String email, String secret) async {
    ResponseDto response;
    //Establecemos la uri para la invocacion
    var uri = Uri.parse("$backendUrl/api/v1/user/restorePassword");
    //Convertimos los parametros a un JSON
    var body = jsonEncode({"email": email, "secret": secret});

    //Establecemos el Content-Type y Accept en las cabeceras
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    //Realizamos la invocacion al servidor backend
    var responseHttp = await http.put(uri, headers: headers, body: body);

    if (responseHttp.statusCode == 200) {
      response = ResponseDto.fromJson(jsonDecode(responseHttp.body));
      print(response);
    } else {
      throw Exception("Error al intentar actualizar la contraseña");
    }
    return response;
  }

  ///Método para obtener informacion del usuario por su token
  static Future<User> getUserByToken() async {
    ResponseDto response;
    User user;
    //Establecemos la uri para la invocacion
    var uri = Uri.parse("$backendUrl/api/v1/user/");
    //Obtenemos el token del almacenamiento seguro
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: "TOKEN");
    if (token == null) throw Exception("Ocurrió un error. Intente nuevamente");
    print(token);
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };

    //Realizamos la invocacion al servidor backend
    var responseHttp = await http.get(uri, headers: headers);
    if (responseHttp.statusCode == 200) {
      response = ResponseDto.fromJson(jsonDecode(responseHttp.body));
      print(response);
      if (response.success) {
        user = User.fromJson(response.data);
        print(user);
      } else {
        throw Exception(response.message);
      }
    } else {
      throw Exception("Error al intentar obtener el usuario");
    }
    return user;
  }

  ///Método para verificar si el correo existe en la base de datos y obtener el usuario
  static Future<User> getUserByEmail(String email) async {
    ResponseDto response;
    User user;
    //Establecemos la uri para la invocacion
    var uri = Uri.parse("$backendUrl/api/v1/user/email/$email");

    //Establecemos el Content-Type y Accept en las cabeceras
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    //Realizamos la invocacion al servidor backend
    var responseHttp = await http.get(uri, headers: headers);
    if (responseHttp.statusCode == 200) {
      response = ResponseDto.fromJson(jsonDecode(responseHttp.body));
      print(response);
      if (response.success) {
        user = User.fromJson(response.data);
        print(user);
      } else {
        throw Exception(response.message);
      }
    } else {
      throw Exception("Error al intentar obtener el usuario");
    }
    return user;
  }

  ///Método para actualizar los datos del usuario
  static Future<ResponseDto> updateUser(User user) async {
    ResponseDto response;
    //Establecemos la uri para la invocacion
    var uri = Uri.parse("$backendUrl/api/v1/user");
    //Convertimos el objeto User a un JSON
    var body = jsonEncode(user.toJson());

    const storage = FlutterSecureStorage();
    //Establecemos el Content-Type y Accept en las cabeceras, junto con el token
    String? token = await storage.read(key: "TOKEN");
    if (token == null) throw Exception("Ocurrió un error. Intente nuevamente");
    print(token);
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };

    //Realizamos la invocacion al servidor backend
    var responseHttp = await http.put(uri, headers: headers, body: body);

    if (responseHttp.statusCode == 200) {
      response = ResponseDto.fromJson(jsonDecode(responseHttp.body));
      print(response);
    } else {
      throw Exception(
          "Error al intentar actualizar la información del usuario");
    }
    return response;
  }

  ///Método para eliminar un usuario
  static Future<ResponseDto> deleteUser() async {
    ResponseDto response;
    //Establecemos la uri para la invocacion
    var uri = Uri.parse("$backendUrl/api/v1/user/");
    //Convertimos el objeto User a un JSON
    var body = jsonEncode({});

    const storage = FlutterSecureStorage();
    //Establecemos el Content-Type y Accept en las cabeceras, junto con el token
    String? token = await storage.read(key: "TOKEN");
    if (token == null) throw Exception("Ocurrió un error. Intente nuevamente");
    print(token);
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };

    //Realizamos la invocacion al servidor backend
    var responseHttp = await http.delete(uri, headers: headers, body: body);

    if (responseHttp.statusCode == 200) {
      response = ResponseDto.fromJson(jsonDecode(responseHttp.body));
      print(response);
    } else {
      throw Exception("Error al eliminar usuario");
    }
    return response;
  }
}
