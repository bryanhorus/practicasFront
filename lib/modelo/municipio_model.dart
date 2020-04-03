import 'package:tenic_api/modelo/departamento_model.dart';

class Municipio {
  String nombre;
  Departamento dept;

  Municipio({this.nombre, this.dept});

  factory Municipio.fromJson(Map<String, dynamic> parsedJson) {
    return Municipio(
      nombre: parsedJson['nombre'],
      dept: parsedJson['dept'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'dept': dept,
      };
}
