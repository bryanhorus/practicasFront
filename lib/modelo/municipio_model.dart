import 'package:tenic_api/modelo/departamento_model.dart';

class Municipio {
  int idMunicipio;
  String nombre;
  Departamento departament;
  

  Municipio({this.idMunicipio,this.nombre, this.departament});

  factory Municipio.fromJson(Map<String, dynamic> parsedJson) {
    return Municipio(
      idMunicipio: parsedJson['idMunicipio'],
      nombre: parsedJson['nombre'],
      departament: Departamento.fromJson(parsedJson['departament'])
    );
  }

  Map<String, dynamic> toJson() => {
        'idMunicipio': idMunicipio,
        'nombre': nombre,
        'departament': departament.toJson()
      };
}
