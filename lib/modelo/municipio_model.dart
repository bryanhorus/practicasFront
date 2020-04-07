import 'package:tenic_api/modelo/departamento_model.dart';

class Municipio {
<<<<<<< HEAD
  int id;//
=======
  int idMunicipio;
>>>>>>> f01f5da794a76f5f28d070c97b772f20f36b6d56
  String nombre;
  Departamento departament;
  

<<<<<<< HEAD
  Municipio({this.nombre, this.dept, this.id});

  factory Municipio.fromJson(Map<String, dynamic> parsedJson) {
    return Municipio(
      //id: parsedJson['id'],
=======
  Municipio({this.idMunicipio,this.nombre, this.departament});

  factory Municipio.fromJson(Map<String, dynamic> parsedJson) {
    return Municipio(
      idMunicipio: parsedJson['idMunicipio'],
>>>>>>> f01f5da794a76f5f28d070c97b772f20f36b6d56
      nombre: parsedJson['nombre'],
      departament: Departamento.fromJson(parsedJson['departament'])
    );
  }

  Map<String, dynamic> toJson() => {
        'idMunicipio': idMunicipio,
        'nombre': nombre,
        'departament': departament.toJson(),
      };
}
