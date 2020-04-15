import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tenic_api/Session_Storage.dart';
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/resource/constants.dart';

class AntenaApiService {

  Antena _antena;

  final SessionStorage _session = SessionStorage();

  AntenaApiService();

  Future<ApiResponse> insertAntena(Antena antena) async {

    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(antena.toJson());
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceAntenaInsert);
    var res = await http.post(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader, 
        HttpHeaders.authorizationHeader:  _session.getToken().toString()},
        body: body2);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      _antena = Antena.fromJson(resBody);
      apiResponse.object = _antena;
    }
    return apiResponse;
  }

  Future<ApiResponse> updateAntena(Antena antena) async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    var body2 = json.encode(antena.toJson());
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceAntenaUpdate);
    var res = await http.put(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader, HttpHeaders.authorizationHeader:  _session.getToken().toString()},
        body: body2);

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;

    if (apiResponse.statusResponse == 200) {
      _antena = Antena.fromJson(resBody);
      apiResponse.object = _antena;
    }
    return apiResponse;
  }

  Future<ApiResponse> deleteAntena(Antena antena) async {
    var queryParameters = {
      'id': antena.idAntena
          .toString(), //query del id que permite identificr en el servicion el acceso
    };
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);

    Uri uri = Uri.http(Constants.urlAuthority,
        Constants.pathServiceAntenaDelete, queryParameters);
    var res = await http.delete(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader, HttpHeaders.authorizationHeader:  _session.getToken().toString()});

    apiResponse.statusResponse = res.statusCode;

    return apiResponse;
  }

  Future<ApiResponse> listarAntena() async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceAntenasLista);
    var res = await http.get(
      uri,
      headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader, HttpHeaders.authorizationHeader: _session.getToken().toString() },
    );

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    apiResponse.listAntena = List();

    if (apiResponse.statusResponse == 200) {
      resBody.forEach((i) {
        apiResponse.listAntena.add(Antena.fromJson(i));
        return i;
      });

      return apiResponse;
    }
    return apiResponse;
  }
}
