import 'package:flutter/material.dart';
import 'package:tenic_api/modelo/LoginUser.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class InicioSesionBloc {
  final Repository _repository = Repository();
  var _apiResponse = ApiResponse();
  bool _validate;

  ApiResponse get apiResponse => _apiResponse;

  InicioSesionBloc(BuildContext context);

  Future<bool> iniciarSesion(BuildContext context,String correo , String password) async {
    _validate = false;
    ApiResponse apiResponse = await _repository.iniciar(context,correo,password);
    if (apiResponse.statusResponse == 200) {
      apiResponse.message = Constants.createMessage;
      return _validate = true;
    } else {
      return _validate;
    }
  }


}
