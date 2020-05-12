import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/enviar_model.dart';
import 'package:tenic_api/resource/constants.dart';

class CorreoApiService {

  Future<ApiResponse> enviaCorreo(Correo correo, String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(correo.toJson());
    print(body2);
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceCorreo);
    var res = await http.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
          HttpHeaders.authorizationHeader: token
        },
        body: body2);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      return apiResponse;
    }
    return apiResponse;
  }
}