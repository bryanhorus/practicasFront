import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/asignar_antena.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class AsignarApiService {
  AsignarAntena _asignarAntena;

  Future<ApiResponse> insertAsignacion(
      AsignarAntena asignarAntena, String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(asignarAntena.toJson());
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceAsignar);
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

  Future<ApiResponse> updateAsignarAntena(
      AsignarAntena asignarAntena, String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(asignarAntena.toJson());
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceAsignarUpdate);
    var res = await http.put(uri,
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

  Future<ApiResponse> listarAsignarAntena(String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceAsignarLista);

    var res = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
      HttpHeaders.authorizationHeader: token
    });

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    apiResponse.listAsignarAntena = List();

    if (apiResponse.statusResponse == 200) {
      resBody.forEach((i) {
        apiResponse.listAsignarAntena.add(AsignarAntena.fromJson(i));
        return i;
      });

      return apiResponse;
    }
    return apiResponse;
  }

  Future<ApiResponse> listaBusquedaAsignar(AsignarAntena antena,String token) async {
    var queryParameters = {
      'idUser': antena.usuario.idUsuario.toString()
    };
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceAsignarListatecnico, queryParameters);

    var res = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
      HttpHeaders.authorizationHeader: token
    });

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    apiResponse.listAsignarAntena = List();

    if (apiResponse.statusResponse == 200) {
      resBody.forEach((i) {
        apiResponse.listAsignarAntena.add(AsignarAntena.fromJson(i));
        return i;
      });

      return apiResponse;
    }
    return apiResponse;
  }
  Future<ApiResponse> listarAntenasAsignadas(String token) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    final Repository _repository = Repository();
    var id = await _repository.getLocalId();
    var queryParameters = {
      'idUser': id
    };
    Uri uri = Uri.http(
        Constants.urlAuthority, Constants.pathServiceAsignarListatecnico, queryParameters );
    var res = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: Constants.contenTypeHeader,
      HttpHeaders.authorizationHeader: token
    });
    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    apiResponse.listAsignarAntena1 = List();
    if (apiResponse.statusResponse == 200) {
      resBody.forEach((i) {
        apiResponse.listAsignarAntena1.add(AsignarAntena.fromJson(i));
        return i;
      });
      return apiResponse;
    }
    return apiResponse;
  }
}
