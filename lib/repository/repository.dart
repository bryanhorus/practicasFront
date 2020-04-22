import 'package:tenic_api/Session_Storage.dart';
import 'package:tenic_api/apiService/antena_api_service.dart';
import 'package:tenic_api/apiService/dpto_api_service.dart';
import 'package:tenic_api/apiService/login_api_service.dart';
import 'package:tenic_api/apiService/municipio_api_service.dart';
import 'package:tenic_api/apiService/observacion_api_service.dart';
import 'package:tenic_api/apiService/torre_api_service.dart';
import 'package:tenic_api/apiService/usuario_api_service.dart';
import 'package:tenic_api/modelo/LoginUser.dart';
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/modelo/observacion_model.dart';
import 'package:tenic_api/modelo/session_local.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import '../modelo/municipio_model.dart';


class Repository {

  final usuarioApiService = UsuarioApiService();
  final loginApiService = LoginApiService();
  final torreApiService = TorreApiService();
  final antenaApiService = AntenaApiService();
  final municipioApiService = MunicipioApiService();
  final departamentoApiService = DepartamentoApiService();
<<<<<<< HEAD
  final observacionApiService = ObservacionApiService();
=======
  final SessionStorage _session = SessionStorage();

>>>>>>> 07b021f848ff036428a46f249f045b1c015a6881

  //promesa de invocacion al usuarioApiService metodo insertar usuario
  Future<Session> iniciar( Login login) => loginApiService.iniciarSesion(login);

  Future<String> getLocalAccessToken() => _session.getToken();

  Future<ApiResponse> registrarUsuario(Usuario usuario) => usuarioApiService.insertUsuario(usuario);
  Future<ApiResponse> actualizarUsuario(Usuario usuario) => usuarioApiService.updateUsuario(usuario);
  Future<ApiResponse> listaUsuario() => usuarioApiService.listarUsuario();
  Future<ApiResponse>eliminarUsuario(Usuario usuario)=> usuarioApiService.deleteUsuario(usuario);
 
  Future<ApiResponse> listaMunicipio() => municipioApiService.listarMunicipio();
  Future<ApiResponse> registrarMunicipio(Municipio municipio) => municipioApiService.insertMunicipio(municipio);
  Future<ApiResponse> actualizarMunicipio(Municipio municipio) => municipioApiService.updateMunicipio(municipio);
  Future<ApiResponse> eliminarMunicipio(Municipio municipio) => municipioApiService.deleteMunicipio(municipio);

  Future<ApiResponse> listaDepartamento() => departamentoApiService.listarDepartamento();
  Future<ApiResponse> registrarDepartamento(Departamento departamento) => departamentoApiService.insertDepartamento(departamento);
  Future<ApiResponse> actualizarDepartamento(Departamento departamento) => departamentoApiService.updateDepartamento(departamento);
  Future<ApiResponse> eliminarDepartamento(Departamento departamento) => departamentoApiService.deleteDepartamento(departamento);
  //Antena
  Future<ApiResponse> registrarAntena(Antena antena, String token) => antenaApiService.insertAntena(antena, token);
  Future<ApiResponse> actualizarAntena(Antena antena, String token) => antenaApiService.updateAntena(antena, token);
  Future<ApiResponse> eliminarAntena(Antena antena, String token) => antenaApiService.deleteAntena(antena, token);
  Future<ApiResponse> listaAntena(String token) => antenaApiService.listarAntena(token);
  //Torre
  Future<ApiResponse> registrarTorre(Torre torre) => torreApiService.insertTorre(torre);
  Future<ApiResponse> actualizarTorre(Torre torre) => torreApiService.updateTorre(torre);
  Future<ApiResponse> eliminarTorre(Torre torre) => torreApiService.deleteTorre(torre);
  Future<ApiResponse> listaTorre() => torreApiService.listarTorre();
  //Observacion
  Future<ApiResponse> registrarObservacion(Observacion observacion) => observacionApiService.insertObservacion(observacion);
    Future<ApiResponse> listaObservation() => observacionApiService.listarObservation();
}