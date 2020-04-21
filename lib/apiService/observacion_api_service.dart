import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tenic_api/Session_Storage.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/observacion_model.dart';
import 'package:tenic_api/resource/constants.dart';

class ObservacionApiService {
  Observacion _observacion;

  final SessionStorage _session = SessionStorage();

  ObservacionApiService();

  Future<ApiResponse> insertObservacion(Observacion observacion) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(observacion.toJson());
    Uri uri = Uri.http(
        Constants.urlAuthority, Constants.pathServiceObservacionInsert);
    var res = await http.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
          HttpHeaders.authorizationHeader: _session.getToken().toString()
        },
        body: body2);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      _observacion = Observacion.fromJson(resBody);
      apiResponse.object = _observacion;
    }
    return apiResponse;
  }
}
