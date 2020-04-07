<<<<<<< HEAD
import 'package:flutter/material.dart';
=======


import 'package:flutter/cupertino.dart';
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class AntenaBloc {
  final Repository _repository = Repository();
  var _apiResponse = ApiResponse();

  ApiResponse get apiResponse => _apiResponse;

  AntenaBloc(BuildContext context);
  Future<ApiResponse> createAntena(Antena antena) async {
    ApiResponse apiResponse =
        await _repository.registrarAntena(antena);
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
    Future<ApiResponse> updateAntena(Antena antena) async {
    ApiResponse apiResponse = await _repository.actualizarAntena(antena);
=======
  Future<ApiResponse> updateAntena(Antena antena) async {
    ApiResponse apiResponse =
        await _repository.actualizarAntena(antena);
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
      Future<ApiResponse> listarAntena() async {
    ApiResponse apiResponse = await _repository.listaAntena();
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.createMessage;
      print(apiResponse.message);
      return apiResponse;
=======
  Future<ApiResponse> deleteAntena(Antena antena) async {
    ApiResponse apiResponse =
        await _repository.eliminarAntena(antena);
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.createMessage;
      print(apiResponse.message);
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
    } else {
      print("el código del error" +
          apiResponse.statusResponse.toString() +
          " El mensaje de error es: " +
          apiResponse.message);
<<<<<<< HEAD
      return apiResponse;
    }
  }

    /*Future<ApiResponse> deleteAntena(Antena antena) async {
    ApiResponse apiResponse = await _repository.eliminarAntena(antena);
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.createMessage;
      print(apiResponse.message);
=======
    }
    return apiResponse;
  }

  Future<ApiResponse> listarAntena() async {
    ApiResponse apiResponse = await _repository.listaAntena();
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.createMessage;
      print(apiResponse.message);
      return apiResponse;
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
    } else {
      print("el código del error" +
          apiResponse.statusResponse.toString() +
          " El mensaje de error es: " +
          apiResponse.message);
<<<<<<< HEAD
    }
    return apiResponse;
  }*/
=======
      return apiResponse;
    }
  }
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
}
