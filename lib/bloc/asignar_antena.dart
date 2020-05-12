import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/asignar_antena.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class AsignarAntenaBloc {
  final Repository _repository = Repository();
  var _apiResponse = ApiResponse();

  ApiResponse get apiResponse => _apiResponse;

  Future<ApiResponse> asignarAntenna(AsignarAntena asignarAntena) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse =
        await _repository.registrarAsignacion(asignarAntena, token);
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

  Future<ApiResponse> updateAsignarAntena(AsignarAntena asignarAntena) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse =
        await _repository.actualizarAsignarAntena(asignarAntena, token);
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

  Future<ApiResponse> listarAsignarAntena() async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.listaAsignarAntena(token);
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

  Future<ApiResponse> listarAsignarAntenatecnico() async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse =
        await _repository.listarAsignarAntenatecnico(token);
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

  Future<ApiResponse> listaBusquedaAsignar(AsignarAntena antena) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse =
        await _repository.listarBusquedaAsignar(antena,token);
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
