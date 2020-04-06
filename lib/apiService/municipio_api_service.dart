import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/resource/constants.dart';

import '../modelo/municipio_model.dart';


class MunicipioApiService {
  MunicipioApiService();
  Municipio _municipio;

  Future<ApiResponse> insertMunicipio(Municipio municipio) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(municipio.toJson());
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceinsertMunicipio);
    var res = await http.post(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader},
        body: body2);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      _municipio = Municipio.fromJson(resBody);
      apiResponse.object = _municipio;
    }
    return apiResponse;
  }

  Future<ApiResponse> updateMunicipio(Municipio municipio) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(municipio.toJson());
    Uri uri = Uri.http(
        Constants.urlAuthority, Constants.pathServiceMunicipioUpdate);
    var res = await http.put(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader},
        body: body2);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      _municipio = Municipio.fromJson(resBody);
      apiResponse.object = _municipio;
    }
    return apiResponse;
  }

  Future<ApiResponse> deleteMunicipio(Municipio municipio) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri = Uri.http(
        Constants.urlAuthority, Constants.pathServiceMunicipioDelete);
    var res = await http.delete(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader});

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      _municipio = Municipio.fromJson(resBody);
      apiResponse.object = _municipio;
    }
    return apiResponse;
  }
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
