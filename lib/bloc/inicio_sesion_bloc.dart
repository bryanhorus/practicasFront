import 'package:flutter/material.dart';
import 'package:tenic_api/Session_Storage.dart';
import 'package:tenic_api/modelo/LoginUser.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/session_local.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class InicioSesionBloc {
  final Repository _repository = Repository();

  bool _access = false;
  Session session;
  final SessionStorage sessionStorage = SessionStorage();

  InicioSesionBloc();

  bool get access => _access;

  Future<bool> iniciarSesion(Login login) async {
    session = await _repository.iniciar(login);
    if (session.accessToken != null) {
      await sessionStorage.saveSessionStorage(session);
      _access = true;
    }
      return _access;
  }
}
