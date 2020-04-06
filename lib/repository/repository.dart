import 'package:tenic_api/apiService/antena_api_service.dart';
import 'package:tenic_api/apiService/dpto_api_service.dart';
import 'package:tenic_api/apiService/login_api_service.dart';
import 'package:tenic_api/apiService/municipio_api_service.dart';
import 'package:tenic_api/apiService/torre_api_service.dart';
import 'package:tenic_api/apiService/usuario_api_service.dart';
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';

import '../modelo/torre_model.dart';

class Repository {

  final usuarioApiService = UsuarioApiService();
  final loginApiService = LoginApiService();
  final torreApiService = TorreApiService();
  final antenaApiService = AntenaApiService();
  final municipioApiService = MunicipioApiService();
  final departamentoApiService = DepartamentoApiService();

  //promesa de invocacion al usuarioApiService metodo insertar usuario
  Future<ApiResponse> iniciar(Usuario usuario) => loginApiService.iniciarSesion(usuario);

  Future<ApiResponse> registrarUsuario(Usuario usuario) => usuarioApiService.insertUsuario(usuario);
  Future<ApiResponse> actualizarUsuario(Usuario usuario) => usuarioApiService.updateUsuario(usuario);
  Future<ApiResponse> listaUsuario() => usuarioApiService.listarUsuario();
  Future<ApiResponse>eliminarUsuario(Usuario usuario)=> usuarioApiService.deleteUsuario(usuario);

  //
  Future<ApiResponse> registrarAntena(Antena antena) => antenaApiService.insertAntena(antena);
  Future<ApiResponse> actualizarAntena(Antena antena) => antenaApiService.updateAntena(antena);
  Future<ApiResponse> listaAntena() => antenaApiService.listarAntena();
  //Future<ApiResponse> eliminarAntena(Antena antena) => antenaApiService.deleteAntena(antena);
  


  Future<ApiResponse> listaMunicipio() => municipioApiService.listarMunicipio();

  Future<ApiResponse> listaDepartamento() => departamentoApiService.listarDepartamento();
  Future<ApiResponse> registrarDepartamento(Departamento departamento) => departamentoApiService.insertDepartamento(departamento);
  Future<ApiResponse> actualizarDepartamento(Departamento departamento) => departamentoApiService.updateDepartamento(departamento);
  Future<ApiResponse> eliminarDepartamento(Departamento departamento) => departamentoApiService.deleteDepartamento(departamento);

//
  Future<ApiResponse> listaTorre() => torreApiService.listarTorre();
  Future<ApiResponse> registrarTorre(Torre torre) => torreApiService.insertTorres(torre);
  Future<ApiResponse> actualizarTorre(Torre torre) => torreApiService.updateTorre(torre);
  Future<ApiResponse> eliminarTorre(Torre torre) => torreApiService.deleteTorre(torre);
}