import 'package:flutter/material.dart';

import '../modelo/api_response_model.dart';
import '../modelo/torre_model.dart';
import '../repository/repository.dart';
import '../resource/constants.dart';

class TorreBLoC {
  
  final Repository _repository = Repository();
  var _apiResponse = ApiResponse();

  ApiResponse get apiResponse => _apiResponse;

  TorreBLoC(BuildContext context);
  Future<ApiResponse> createTorre(Torre torre) async {
    ApiResponse apiResponse =
        await _repository.registrarTorre(torre);
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

    Future<ApiResponse> updateTorre(Torre torre) async {
    ApiResponse apiResponse =
        await _repository.actualizarTorre(torre);
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

    Future<ApiResponse> deleteTorre(Torre torre) async {
    ApiResponse apiResponse =
        await _repository.eliminarTorre(torre);
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

    Future<ApiResponse> listarTorre() async {
    ApiResponse apiResponse = await _repository.listaTorre();
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