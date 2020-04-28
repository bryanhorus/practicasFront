
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class DptoBloc {
  final Repository _repository = Repository();
  var _apiResponse = ApiResponse();

  ApiResponse get apiResponse => _apiResponse;

  Future<ApiResponse> createDepartamento(Departamento departamento) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse =
        await _repository.registrarDepartamento(departamento, token);
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.createMessage;
      print(apiResponse.message);
    } else {
      print(Constants.errorCode +
          apiResponse.statusResponse.toString() +
          Constants.errorMessage +
          apiResponse.message);
    }
    return apiResponse;
  }

  Future<ApiResponse> updateDepartamento(Departamento departamento) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse =
        await _repository.actualizarDepartamento(departamento, token);
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.createMessage;
      print(apiResponse.message);
    } else {
      print(Constants.errorCode +
          apiResponse.statusResponse.toString() +
          Constants.errorMessage +
          apiResponse.message);
    }
    return apiResponse;
  }

  Future<ApiResponse> deleteDepartamento(Departamento departamento) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse =
        await _repository.eliminarDepartamento(departamento, token);
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.createMessage;
      print(apiResponse.message);
    } else {
      print(Constants.errorCode +
          apiResponse.statusResponse.toString() +
          Constants.errorMessage +
          apiResponse.message);
    }
    return apiResponse;
  }

  Future<ApiResponse> listarDepartamento() async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.listaDepartamento(token);
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.createMessage;
      print(apiResponse.message);
      return apiResponse;
    } else {
      print(Constants.errorCode +
          apiResponse.statusResponse.toString() +
          Constants.errorMessage +
          apiResponse.message);
      return apiResponse;
    }
  }
}
