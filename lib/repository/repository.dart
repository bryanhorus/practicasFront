import 'package:tenic_api/Session_Storage.dart';
import 'package:tenic_api/apiService/antena_api_service.dart';
import 'package:tenic_api/apiService/dpto_api_service.dart';
import 'package:tenic_api/apiService/login_api_service.dart';
import 'package:tenic_api/apiService/municipio_api_service.dart';
import 'package:tenic_api/apiService/torre_api_service.dart';
import 'package:tenic_api/apiService/usuario_api_service.dart';
import 'package:tenic_api/modelo/LoginUser.dart';
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
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
  final SessionStorage _session = SessionStorage();


  //promesa de invocacion al usuarioApiService metodo insertar usuario
  Future<Session> iniciar( Login login) => loginApiService.iniciarSesion(login);

  Future<String> getLocalAccessToken() => _session.getToken();

  Future<ApiResponse> registrarUsuario(Usuario usuario) => usuarioApiService.insertUsuario(usuario);
  Future<ApiResponse> actualizarUsuario(Usuario usuario) => usuarioApiService.updateUsuario(usuario);
  Future<ApiResponse> listaUsuario() => usuarioApiService.listarUsuario();
  Future<ApiResponse>eliminarUsuario(Usuario usuario)=> usuarioApiService.deleteUsuario(usuario);
  
  Future<ApiResponse> listaMunicipio(String token) => municipioApiService.listarMunicipio(token);
  Future<ApiResponse> registrarMunicipio(Municipio municipio, String token) => municipioApiService.insertMunicipio(municipio, token);
  Future<ApiResponse> actualizarMunicipio(Municipio municipio, String token) => municipioApiService.updateMunicipio(municipio, token);
  Future<ApiResponse> eliminarMunicipio(Municipio municipio, String token) => municipioApiService.deleteMunicipio(municipio, token);

  Future<ApiResponse> listaDepartamento(String token) => departamentoApiService.listarDepartamento(token);
  Future<ApiResponse> registrarDepartamento(Departamento departamento, String token) => departamentoApiService.insertDepartamento(departamento, token);
  Future<ApiResponse> actualizarDepartamento(Departamento departamento, String token) => departamentoApiService.updateDepartamento(departamento, token);
  Future<ApiResponse> eliminarDepartamento(Departamento departamento, String token) => departamentoApiService.deleteDepartamento(departamento, token);
  //Antena
  Future<ApiResponse> registrarAntena(Antena antena, String token) => antenaApiService.insertAntena(antena, token);
  Future<ApiResponse> actualizarAntena(Antena antena, String token) => antenaApiService.updateAntena(antena, token);
  Future<ApiResponse> eliminarAntena(Antena antena, String token) => antenaApiService.deleteAntena(antena, token);
  Future<ApiResponse> listaAntena(String token) => antenaApiService.listarAntena(token);
  //Torre
  Future<ApiResponse> registrarTorre(Torre torre, String token) => torreApiService.insertTorre(torre, token);
  Future<ApiResponse> actualizarTorre(Torre torre, String token) => torreApiService.updateTorre(torre, token);
  Future<ApiResponse> eliminarTorre(Torre torre, String token) => torreApiService.deleteTorre(torre, token);
  Future<ApiResponse> listaTorre(String token) => torreApiService.listarTorre(token);
}