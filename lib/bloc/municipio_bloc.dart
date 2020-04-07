import 'package:flutter/material.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

import '../modelo/municipio_model.dart';


class MunicipioBloc {
  final Repository _repository = Repository();
  var _apiResponse = ApiResponse();

  ApiResponse get apiResponse => _apiResponse;

 MunicipioBloc(BuildContext context);
  Future<ApiResponse> createMunicipio(Municipio municipio) async {
    ApiResponse apiResponse =
        await _repository.registrarMunicipio(municipio);
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.createMessage;
      print(apiResponse.message);
    } else {
      print("el código del error" +
          apiResponse.statusResponse.toString() +
          " El mensaje de error es: " +
          apiResponse.message);
    }
    return apiResponse;
  }
    Future<ApiResponse> updateMunicipio(Municipio municipio) async {
    ApiResponse apiResponse = await _repository.actualizarMunicipio(municipio);
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.createMessage;
      print(apiResponse.message);
    } else {
      print("el código del error" +
          apiResponse.statusResponse.toString() +
          " El mensaje de error es: " +
          apiResponse.message);
    }
    return apiResponse;
  }

  Future<ApiResponse> listarMunicipio() async {
    ApiResponse apiResponse = await _repository.listaMunicipio();
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.createMessage;
      print(apiResponse.message);
      return apiResponse;
    } else {
      print("el código del error" +
          apiResponse.statusResponse.toString() +
          " El mensaje de error es: " +
          apiResponse.message);
      return apiResponse;
    }
  }
}

