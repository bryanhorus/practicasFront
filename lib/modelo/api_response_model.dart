import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/asignar_antena.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/modelo/observacion_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';

import 'torre_model.dart';

class ApiResponse {
  int statusResponse;
  String message;
  Object object;

  ApiResponse({this.statusResponse, this.object, this.message});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
        statusResponse: json['statusResponse'], object: json['object']);
  }

  Map<String, dynamic> toJson() =>
      {'statusResponse': statusResponse, 'object': object};

  List<Usuario> listUsuario = List();
  List<Municipio> listMunicipio = List();
  List<Observacion> listObservation = List();
  List<Observacion> listbusqueda = List();
  List<Departamento> listDepartamento = List();
  List<Antena> listAntena = List();
  List<Torre> listTorre = List();
  List<AsignarAntena> listAsignarAntena = List();
  List<AsignarAntena> listAsignarAntena1 = List();
}
