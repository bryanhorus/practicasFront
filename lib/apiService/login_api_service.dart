import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tenic_api/modelo/LoginUser.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiService {
  LoginApiService();


  Future<ApiResponse> iniciarSesion( BuildContext context, String correo, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, String> body = {
      'correo': correo,
      'password': password
    };
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(body);
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceLogin);
    var res = await http.post(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader},
        body: body2);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      var _usuario = new LoginUser.fromJson(resBody);
      sharedPreferences.setString("token", resBody['token']);
      saveCurrentLogin(_usuario);
      TecniNavigator.goToHomeCoordinador(context);
      return apiResponse;
    } else {
      return apiResponse;
    }
  }
  static saveCurrentLogin(LoginUser user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', user.token);
    await preferences.setInt('id', user.idUser);
    await preferences.setString('nombre', user.nombre);
  }
  static Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("token");
  }
}
