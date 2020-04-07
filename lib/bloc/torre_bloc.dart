<<<<<<< HEAD
import 'package:flutter/material.dart';

import '../modelo/api_response_model.dart';
import '../modelo/torre_model.dart';
import '../repository/repository.dart';
import '../resource/constants.dart';

class TorreBLoC {
  
=======
import 'package:flutter/cupertino.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class TorreBloc {
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
  final Repository _repository = Repository();
  var _apiResponse = ApiResponse();

  ApiResponse get apiResponse => _apiResponse;

<<<<<<< HEAD
  TorreBLoC(BuildContext context);
  Future<ApiResponse> createTorre(Torre torre) async {
    ApiResponse apiResponse =
        await _repository.registrarTorre(torre);//
=======
  TorreBloc(BuildContext context);
  Future<ApiResponse> createTorre(Torre torre) async {
    ApiResponse apiResponse =
        await _repository.registrarTorre(torre);
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
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

<<<<<<< HEAD
    Future<ApiResponse> updateTorre(Torre torre) async {
=======
  Future<ApiResponse> updateTorre(Torre torre) async {
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
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

<<<<<<< HEAD
    Future<ApiResponse> deleteTorre(Torre torre) async {
=======
  Future<ApiResponse> deleteTorre(Torre torre) async {
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
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

<<<<<<< HEAD
    Future<ApiResponse> listarTorre() async {
=======
  Future<ApiResponse> listarTorre() async {
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
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
<<<<<<< HEAD
}
=======
}
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
