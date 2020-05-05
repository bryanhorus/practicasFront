import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/resource/constants.dart';


class DepartamentoApiService {
  Departamento _departamento;

  Future<ApiResponse> insertDepartamento(
      Departamento departamento, String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(departamento.toJson());
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceinsertDpto);
    var res = await http.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
          HttpHeaders.authorizationHeader: token
        },
        body: body2);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      _departamento = Departamento.fromJson(resBody);
      apiResponse.object = _departamento;
    }
    return apiResponse;
  }

  Future<ApiResponse> updateDepartamento(
      Departamento departamento, String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(departamento.toJson());
    Uri uri = Uri.http(
        Constants.urlAuthority, Constants.pathServiceDepartamentoUpdate);
    var res = await http.put(uri,
        headers: {
          HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
          HttpHeaders.authorizationHeader: token
        },
        body: body2);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      _departamento = Departamento.fromJson(resBody);
      apiResponse.object = _departamento;
    }
    return apiResponse;
  }

  Future<ApiResponse> deleteDepartamento(
      Departamento departamento, String token) async {
    var queryParameters = {
      'id': departamento.idDpto
          .toString(),
    };
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);

    Uri uri = Uri.http(Constants.urlAuthority,
        Constants.pathServiceDepartamentoDelete, queryParameters);
    var res = await http.delete(uri, headers: {
      HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
      HttpHeaders.authorizationHeader: token
    });

    apiResponse.statusResponse = res.statusCode;

    return apiResponse;
  }

  Future<ApiResponse> listarDepartamento(String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceDepartamento);
    var res = await http.get(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
        HttpHeaders.authorizationHeader: token
      },
    );

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    apiResponse.listDepartamento = List();

    if (apiResponse.statusResponse == 200) {
      resBody.forEach((i) {
        apiResponse.listDepartamento.add(Departamento.fromJson(i));
        return i;
      });

      return apiResponse;
    }
    return apiResponse;
  }
}
