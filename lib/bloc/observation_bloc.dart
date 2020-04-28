
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class ObservationBloc {

  final Repository _repository = Repository();
  var _apiResponse = ApiResponse();

  ApiResponse get apiResponse => _apiResponse;
    Future<ApiResponse> listarObservation() async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.listaObservation(token);
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