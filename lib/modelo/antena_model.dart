import 'package:tenic_api/modelo/torre_model.dart';

class Antena {
  String nombre;
  String referencia;
  String altura;
  String orientacion;
  String inclinacion;
  Torre torre;

  Antena(
      {this.nombre,
      this.referencia,
      this.altura,
      this.orientacion,
      this.inclinacion,
      this.torre, String torrea});

  factory Antena.fromJson(Map<String, dynamic> parsedJson) {
    return Antena(
      nombre: parsedJson['nombre'],
      referencia: parsedJson['referencia'],
      altura: parsedJson['altura'],
      orientacion: parsedJson['orientacion'],
      inclinacion: parsedJson['inclinacion'],
      torre: parsedJson['torre'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'referencia': referencia,
        'altura': altura,
        'orientacion': orientacion,
        'inclinacion': inclinacion,
        'torre': torre,
      };
}
