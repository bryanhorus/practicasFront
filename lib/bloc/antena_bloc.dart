import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class AntenaBloc {
  final Repository _repository = Repository();
  var _apiResponse = ApiResponse();

  ApiResponse get apiResponse => _apiResponse;

  Future<ApiResponse> createAntena(Antena antena) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse =
        await _repository.registrarAntena(antena, token);
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

  Future<ApiResponse> updateAntena(Antena antena) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse =
        await _repository.actualizarAntena(antena, token);
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

  Future<ApiResponse> deleteAntena(Antena antena) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse =
        await _repository.eliminarAntena(antena, token);
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

  Future<ApiResponse> listarAntena() async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.listaAntena(token);
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
