import 'package:tenic_api/modelo/estado_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';

class Antena {
  String nombre;
  String referencia;
  String altura;
  String orientacion;
  String inclinacion;
  Torre torre;
  Estado estado;

  Antena(
      {this.nombre,
      this.referencia,
      this.altura,
      this.orientacion,
      this.inclinacion,
      this.torre, 
      this.estado});

  factory Antena.fromJson(Map<String, dynamic> parsedJson) {
    return Antena(
      nombre: parsedJson['nombre'],
      referencia: parsedJson['referencia'],
      altura: parsedJson['altura'],
      orientacion: parsedJson['orientacion'],
      inclinacion: parsedJson['inclinacion'],
      torre: Torre.fromJson(parsedJson['torre']),
      estado: Estado.fromJson(parsedJson['estado'])

    );
  }

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'referencia': referencia,
        'altura': altura,
        'orientacion': orientacion,
        'inclinacion': inclinacion,
        'torre': torre.toJson(),
        'estado': estado.toJson()
      };
}
