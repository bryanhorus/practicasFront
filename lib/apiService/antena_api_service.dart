import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/resource/constants.dart';

class AntenaApiService {
  Antena _antena;
  AntenaApiService();

  Future<ApiResponse> insertAntena(Antena antena) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(antena.toJson());
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceAntena);
    var res = await http.post(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader},
        body: body2);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      _antena = Antena.fromJson(resBody);
      apiResponse.object = _antena;
    }
    return apiResponse;
  }
}
