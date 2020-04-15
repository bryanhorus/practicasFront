import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import 'package:tenic_api/resource/constants.dart';
import '../Session_Storage.dart';

class UsuarioApiService {
  Usuario _usuario;

  UsuarioApiService();
  final SessionStorage _session = SessionStorage();

  Future<ApiResponse> insertUsuario(Usuario usuario) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(usuario.toJson());
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceUsuario);
    var res = await http.post(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
        HttpHeaders.authorizationHeader:  _session.getToken().toString()},
        body: body2);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
     // _usuario = Usuario.fromJson(resBody);
     // apiResponse.object = _usuario;
    }
    return apiResponse;
  }

  Future<ApiResponse> updateUsuario(Usuario usuario) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(usuario.toJson());
    Uri uri =
    Uri.http(Constants.urlAuthority, Constants.pathServiceUsuarioUpdate);
    var res = await http.put(uri,
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

  Future<ApiResponse> listarUsuario() async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceListUsuario);
    var res = await http.get(
      uri,
      headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader , 
      HttpHeaders.authorizationHeader: _session.getToken().toString()}
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
    var queryParameters = {
      'id': usuario.idUsuario.toString(),//query del id que permite identificr en el servicion el acceso
    };
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceDeleteU,
        queryParameters);
    var res = await http.delete(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader, HttpHeaders.authorizationHeader: _session.getToken().toString()});
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {

    }
    return apiResponse;

  }

}

