import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/observation_model.dart';
import 'package:tenic_api/resource/constants.dart';

class ObservationApiService {
  ObservationApiService();
  //Observation _observation;

    Future<ApiResponse> listarObservation() async {
    ApiResponse apiResponse = ApiResponse(statusResponse: 0);
    Uri uri =
        Uri.http(Constants.urlAuthority, Constants.pathServiceObsLista);
    var res = await http.get(
      uri,
      headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader},
    );

    var resBody = json.decode(res.body);
    apiResponse.statusResponse = res.statusCode;
    apiResponse.listObservation = List();

    if (apiResponse.statusResponse == 200) {
      resBody.forEach((i) {
        apiResponse.listObservation.add(Observation.fromJson(i));
        return i;
      });

      return apiResponse;
    }
    return apiResponse;
  }
}