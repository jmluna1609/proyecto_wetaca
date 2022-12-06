import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../classes/plato.dart';
import '../classes/user.dart';
import '../dto/response_dto.dart';
import 'package:http/http.dart' as http;

/// Clase para realizar solicitudes REST a Backend en cuanto a usuarios
class PlatoService {
  //Direccion URL del servidor backend
  static const String backendUrl = "http://192.168.0.2:7777";

  /// Metodo para registrar un usuario en la base de datos
  static Future<ResponseDto> register(Plato plato) async {
    ResponseDto response;
    //Establecemos la uri para la invocacion
    var uri = Uri.parse("$backendUrl/api/v1/plato");
    //Convertimos el objeto User a un JSON
    var body = jsonEncode(plato.toJson());

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
      throw Exception("Error al intentar registrar al plato");
    }
    return response;
  }
}
