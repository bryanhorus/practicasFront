import 'package:tenic_api/modelo/estado_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';

class Antena {
  int idAntena;
  String nombre;
  String referencia;
  String altura;
  String orientacion;
  String inclinacion;
  Torre torre;
  Estado state;

  Antena(
      {this.idAntena,
      this.nombre,
      this.referencia,
      this.altura,
      this.orientacion,
      this.inclinacion,
      this.torre, 
      this.state});

  factory Antena.fromJson(Map<String, dynamic> parsedJson) {
    return Antena(
      idAntena: parsedJson['idAntena'],
      nombre: parsedJson['nombre'],
      referencia: parsedJson['referencia'],
      altura: parsedJson['altura'],
      orientacion: parsedJson['orientacion'],
      inclinacion: parsedJson['inclinacion'],
      torre: Torre.fromJson(parsedJson['torre']),
      state: Estado.fromJson(parsedJson['estado'])

    );
  }

  Map<String, dynamic> toJson() => {
        'idAntena': idAntena,
        'nombre': nombre,
        'referencia': referencia,
        'altura': altura,
        'orientacion': orientacion,
        'inclinacion': inclinacion,
        'torre': torre.toJson(),
        'estado': state.toJson()
      };
}
