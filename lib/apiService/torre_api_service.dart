import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/resource/constants.dart';

//import '../modelo/torre_model.dart';

class TorreApiService {
  Torre _torre;
  TorreApiService();

  Future<ApiResponse> insertTorres(Torre torre) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(torre.toJson());
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceinsertTorre);
    var res = await http.post(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader},
        body: body2);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      _torre = Torre.fromJson(resBody);
      apiResponse.object = _torre;
    }
    return apiResponse;
  }

    Future<ApiResponse> updateTorre(Torre torre) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(torre.toJson());
    Uri uri = Uri.http(
        Constants.urlAuthority, Constants.pathServiceTorreUpdate);
    var res = await http.put(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader},
        body: body2);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      _torre = Torre.fromJson(resBody);
      apiResponse.object = _torre;
    }
    return apiResponse;
  }

    Future<ApiResponse> deleteTorre(Torre torre) async {
    var queryParameters = {
      'id': torre.identificacionTorre
          .toString(), //query del id que permite identificr en el servicion el acceso
    };
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);

    Uri uri = Uri.http(Constants.urlAuthority,
        Constants.pathServiceDeleteTorre, queryParameters);
    var res = await http.delete(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader});

    apiResponse.statusResponse = res.statusCode;

    return apiResponse;
  }

    Future<ApiResponse> listarTorre() async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceTorre);
    var res = await http.get(
      uri,
      headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader},
    );

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    apiResponse.listTorre = List();

    if (apiResponse.statusResponse == 200) {
      resBody.forEach((i) {
        apiResponse.listTorre.add(Torre.fromJson(i));
        return i;
      });

      return apiResponse;
    }
    return apiResponse;
  }
}
