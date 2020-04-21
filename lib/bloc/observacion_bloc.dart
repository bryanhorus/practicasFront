import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/observacion_model.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class ObservacionBloc {
  final Repository _repository = Repository();
  var _apiResponse = ApiResponse();

  ApiResponse get apiResponse => _apiResponse;

  Future<ApiResponse> createObservacion(Observacion observacion) async {
    ApiResponse apiResponse =
        await _repository.registrarObservacion(observacion);
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
}
