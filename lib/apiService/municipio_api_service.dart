import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/resource/constants.dart';

class MunicipioApiService {
  MunicipioApiService();

  Future<ApiResponse> listarMunicipio() async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceMinicipiosLista);
    var res = await http.get(
      uri,
      headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader},
    );

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    apiResponse.listMunicipio = List();

    if (apiResponse.statusResponse == 200) {
      resBody.forEach((i) {
        apiResponse.listMunicipio.add(Municipio.fromJson(i));
        return i;
      });

      return apiResponse;
    }
    return apiResponse;
  }
}
