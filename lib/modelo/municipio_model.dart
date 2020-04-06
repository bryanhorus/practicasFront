import 'package:tenic_api/modelo/departamento_model.dart';

class Municipio {
  int id;//
  String nombre;
  Departamento dept;

  Municipio({this.nombre, this.dept, this.id});

  factory Municipio.fromJson(Map<String, dynamic> parsedJson) {
    return Municipio(
      //id: parsedJson['id'],
      nombre: parsedJson['nombre'],
      dept: parsedJson['dept'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'dept': dept,
      };
}
