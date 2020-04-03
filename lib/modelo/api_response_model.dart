import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';

class ApiResponse {
  int statusResponse;
  String message;
  Object object;

  List<Usuario> listUsuario = List();
  List<Municipio> listMunicipio = List();
  List<Departamento> listDepartamento = List();
  ApiResponse({this.statusResponse, this.object, this.message});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
        statusResponse: json['statusResponse'], object: json['object']);
  }

  Map<String, dynamic> toJson() =>
      {'statusResponse': statusResponse, 'object': object};
}
