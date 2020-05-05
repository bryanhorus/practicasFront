import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/observacion_model.dart';
import 'package:tenic_api/resource/constants.dart';

class ObservacionApiService {
  Observacion _observacion;

  Future<ApiResponse> insertObservacion(Observacion observacion, String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(observacion.toJson());
    Uri uri = Uri.http(
        Constants.urlAuthority, Constants.pathServiceObservacionInsert);
    var res = await http.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
          HttpHeaders.authorizationHeader: token
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

    Future<ApiResponse> listarObservation(String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceObsLista);
    var res = await http.get(
      uri,
      headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
      HttpHeaders.authorizationHeader: token}
    );

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    apiResponse.listObservation = List();

    if (apiResponse.statusResponse == 200) {
      resBody.forEach((i) {
        apiResponse.listObservation.add(Observacion.fromJson(i));
        return i;
      });

      return apiResponse;
    }
    return apiResponse;
  }

  Future<ApiResponse> buscarObservacion(Observacion observacion,String token) async {
    var queryParameters = {
      'idAntena': observacion.antena.idAntena.toString()
    };
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceBuscarObservacion,
        queryParameters);
    var res = await http.get(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader, 
        HttpHeaders.authorizationHeader: token});

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;


    if (apiResponse.statusResponse == 200) {
      resBody.forEach((i) {
        apiResponse.listbusqueda.add(Observacion.fromJson(i));
        return i;
      });

      return apiResponse;
    }
    return apiResponse;
  }
}
