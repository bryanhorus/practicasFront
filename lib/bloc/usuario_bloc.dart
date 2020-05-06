
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/recuperar.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class UsuarioBloc {
  final Repository _repository = Repository();
  var _apiResponse = ApiResponse();

  ApiResponse get apiResponse => _apiResponse;

  Future<ApiResponse> createUsuario(Usuario usuario) async {
    ApiResponse apiResponse = await _repository.registrarUsuario(usuario);
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

  Future<ApiResponse> updateUsuario(Usuario usuario) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.actualizarUsuario(usuario, token);
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

  Future<ApiResponse> listarUsuario() async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.listaUsuario(token);
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

  Future<ApiResponse> deleteUsuario(Usuario usuario) async {
    String token = await _repository.getLocalAccessToken();
    ApiResponse apiResponse = await _repository.eliminarUsuario(usuario, token);
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

    Future<ApiResponse> updateContrasena(Recuperar usuario) async {
    ApiResponse apiResponse = await _repository.actualizarContrasena(usuario);
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
