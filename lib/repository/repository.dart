import 'package:tenic_api/Session_Storage.dart';
import 'package:tenic_api/apiService/antena_api_service.dart';
import 'package:tenic_api/apiService/asignar_api_service.dart';
import 'package:tenic_api/apiService/dpto_api_service.dart';
import 'package:tenic_api/apiService/login_api_service.dart';
import 'package:tenic_api/apiService/municipio_api_service.dart';
import 'package:tenic_api/apiService/observacion_api_service.dart';
import 'package:tenic_api/apiService/torre_api_service.dart';
import 'package:tenic_api/apiService/usuario_api_service.dart';
import 'package:tenic_api/modelo/LoginUser.dart';
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/asignar_antena.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/modelo/observacion_model.dart';
import 'package:tenic_api/modelo/session_local.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import '../modelo/municipio_model.dart';

class Repository {
  final UsuarioApiService usuarioApiService = UsuarioApiService();
  final LoginApiService loginApiService = LoginApiService();
  final TorreApiService torreApiService = TorreApiService();
  final AntenaApiService antenaApiService = AntenaApiService();
  final MunicipioApiService municipioApiService = MunicipioApiService();
  final DepartamentoApiService departamentoApiService =
      DepartamentoApiService();
  final AsignarApiService asignarApiService = AsignarApiService();
  final SessionStorage _session = SessionStorage();
  final ObservacionApiService observacionApiService = ObservacionApiService();

  Future<Session> iniciar(Login login) => loginApiService.iniciarSesion(login);
  Future<String> getLocalAccessToken() => _session.getToken();
  Future deleteAll() => _session.deleteAllValues();
  Future<String> getLocalRol() => _session.getRol();

  //Usuario
  Future<ApiResponse> registrarUsuario(Usuario usuario) =>
      usuarioApiService.insertUsuario(usuario);
  Future<ApiResponse> actualizarUsuario(Usuario usuario, String token) =>
      usuarioApiService.updateUsuario(usuario, token);
  Future<ApiResponse> listaUsuario(String token) =>
      usuarioApiService.listarUsuario(token);
  Future<ApiResponse> eliminarUsuario(Usuario usuario, String token) =>
      usuarioApiService.deleteUsuario(usuario, token);
  //Municipio
  Future<ApiResponse> listaMunicipio(String token) =>
      municipioApiService.listarMunicipio(token);
  Future<ApiResponse> registrarMunicipio(Municipio municipio, String token) =>
      municipioApiService.insertMunicipio(municipio, token);
  Future<ApiResponse> actualizarMunicipio(Municipio municipio, String token) =>
      municipioApiService.updateMunicipio(municipio, token);
  Future<ApiResponse> eliminarMunicipio(Municipio municipio, String token) =>
      municipioApiService.deleteMunicipio(municipio, token);
  //Deartamento
  Future<ApiResponse> listaDepartamento(String token) =>
      departamentoApiService.listarDepartamento(token);
  Future<ApiResponse> registrarDepartamento(
          Departamento departamento, String token) =>
      departamentoApiService.insertDepartamento(departamento, token);
  Future<ApiResponse> actualizarDepartamento(
          Departamento departamento, String token) =>
      departamentoApiService.updateDepartamento(departamento, token);
  Future<ApiResponse> eliminarDepartamento(
          Departamento departamento, String token) =>
      departamentoApiService.deleteDepartamento(departamento, token);
  //Antena
  Future<ApiResponse> registrarAntena(Antena antena, String token) =>
      antenaApiService.insertAntena(antena, token);
  Future<ApiResponse> actualizarAntena(Antena antena, String token) =>
      antenaApiService.updateAntena(antena, token);
  Future<ApiResponse> eliminarAntena(Antena antena, String token) =>
      antenaApiService.deleteAntena(antena, token);
  Future<ApiResponse> listaAntena(String token) =>
      antenaApiService.listarAntena(token);
  //Torre
  Future<ApiResponse> registrarTorre(Torre torre, String token) =>
      torreApiService.insertTorre(torre, token);
  Future<ApiResponse> actualizarTorre(Torre torre, String token) =>
      torreApiService.updateTorre(torre, token);
  Future<ApiResponse> eliminarTorre(Torre torre, String token) =>
      torreApiService.deleteTorre(torre, token);
  Future<ApiResponse> listaTorre(String token) =>
      torreApiService.listarTorre(token);
  //Observacion
  Future<ApiResponse> registrarObservacion(
          Observacion observacion, String token) =>
      observacionApiService.insertObservacion(observacion, token);
  Future<ApiResponse> listaObservation(String token) =>
      observacionApiService.listarObservation(token);
  //Asignar antena
  Future<ApiResponse> registrarAsignacion(AsignarAntena asignarAntena, String token) =>
      asignarApiService.insertAsignacion(asignarAntena, token);
}
