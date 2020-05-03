import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/asignar_antena.dart';
import 'package:tenic_api/resource/constants.dart';

class AsignarApiService {
  AsignarAntena _asignarAntena;

  Future<ApiResponse> insertAsignacion(
      AsignarAntena asignarAntena, String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(asignarAntena.toJson());
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceAsignar);
    var res = await http.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
          HttpHeaders.authorizationHeader: token
        },
        body: body2);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      _asignarAntena = AsignarAntena.fromJson(resBody);
      apiResponse.object = _asignarAntena;
    }
    return apiResponse;
  }
}
