import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import 'package:tenic_api/resource/constants.dart';

class LoginApiService {
  LoginApiService();

  Future<ApiResponse> iniciarSesion(Usuario _usuario) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(_usuario.toJson());
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceLogin);
    var res = await http.post(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader},
        body: body2);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      _usuario = Usuario.fromJson(resBody);
      apiResponse.object = _usuario;
      return apiResponse;
    } else {
      return apiResponse;
    }
  }
}
