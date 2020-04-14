import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tenic_api/apiService/login_api_service.dart';
import 'package:tenic_api/bloc/inicio_sesion_bloc.dart';
import 'package:tenic_api/modelo/LoginUser.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import 'package:tenic_api/resource/constants.dart';

class UsuarioApiService {
  Usuario _usuario;
  LoginApiService loginApiService;
  UsuarioApiService();
  SharedPreferences sharedPreferences;

  Future<ApiResponse> insertUsuario(Usuario usuario) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(usuario.toJson());
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceUsuario);
    var res = await http.post(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader},
        body: body2);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      _usuario = Usuario.fromJson(resBody);
      apiResponse.object = _usuario;
    }
    return apiResponse;
  }

  Future<ApiResponse> updateUsuario(Usuario usuario) async {
    sharedPreferences = await SharedPreferences.getInstance();
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(usuario.toJson());
    Uri uri =
    Uri.http(Constants.urlAuthority, Constants.pathServiceUsuarioUpdate);
    var res = await http.put(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader, HttpHeaders.authorizationHeader: sharedPreferences.getString("token")},
        body: body2);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      _usuario = Usuario.fromJson(resBody);
      apiResponse.object = _usuario;
    }
    return apiResponse;
  }

  Future<ApiResponse> listarUsuario() async {
    sharedPreferences = await SharedPreferences.getInstance();
    LoginApiService.getToken().then((token){   });
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceListUsuario);
    var res = await http.get(
      uri,
      headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader , HttpHeaders.authorizationHeader: sharedPreferences.getString("token")},
    );

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    apiResponse.listUsuario = List();

    if (apiResponse.statusResponse == 200) {
      resBody.forEach((i) {
        apiResponse.listUsuario.add(Usuario.fromJson(i));
        return i;
      });

      return apiResponse;
    }
    return apiResponse;
  }

  Future<ApiResponse> deleteUsuario(Usuario usuario) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var queryParameters = {
      'id': usuario.idUsuario.toString(),//query del id que permite identificr en el servicion el acceso
    };
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceDeleteU,
        queryParameters);
    var res = await http.delete(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader, HttpHeaders.authorizationHeader: sharedPreferences.getString("token")});
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {

    }
    return apiResponse;

  }
}

