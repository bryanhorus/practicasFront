import 'package:tenic_api/modelo/estado_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';

class Antena {
  int idAntena;
  String nombre;
  String referencia;
  String altura;
  String orientacion;
  String inclinacion;
  Estado state;
  Torre torre;
  //Estado state;

  Antena(
      {this.idAntena,
      this.nombre,
      this.referencia,
      this.altura,
      this.orientacion,
      this.inclinacion,
      this.state,
      this.torre});

  factory Antena.fromJson(Map<String, dynamic> parsedJson) {
    return Antena(
      idAntena: parsedJson['idAntena'],
      nombre: parsedJson['nombre'],
      referencia: parsedJson['referencia'],
      altura: parsedJson['altura'],
      orientacion: parsedJson['orientacion'],
      inclinacion: parsedJson['inclinacion'],
      state: Estado.fromJson(parsedJson['state']),
      torre: Torre.fromJson(parsedJson['torre'])
    );
  }

  Map<String, dynamic> toJson() => {
        'idAntena': idAntena,
        'nombre': nombre,
        'referencia': referencia,
        'altura': altura,
        'orientacion': orientacion,
        'inclinacion': inclinacion,
        'state': state.toJson(),
        'torre': torre.toJson()
      };
}
