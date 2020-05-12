import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/enviar_model.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class CorreoBloc {
  final Repository _repository = Repository();
  var _apiResponse = ApiResponse();

  ApiResponse get apiResponse => _apiResponse;

  Future<ApiResponse> enviaCorreo(Correo correo) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse =
        await _repository.enviarCorreo(correo, token);
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