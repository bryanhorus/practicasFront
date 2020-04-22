import 'package:tenic_api/modelo/antena_model.dart';

class Observacion{
  int idObservacion;
  String fecha;
  String orientacion;
  String inclinacion;
  Antena antena;
  

  Observacion({
    this.idObservacion,
    this.fecha,
    this.orientacion,
    this.inclinacion,
    this.antena
  });

  factory Observacion.fromJson(Map<String, dynamic> parsedJson) {
    return Observacion(
      idObservacion: parsedJson['id'],
      fecha: parsedJson['fecha'],
      orientacion: parsedJson['orientacion'],
      inclinacion: parsedJson['inclinacion'],
      antena: Antena.fromJson(parsedJson['antenna'])
    );
  }

  Map<String, dynamic> toJson() => {
        'id': idObservacion,
        'fecha': fecha,
        'orientacion': orientacion,
        'inclinacion': inclinacion,
        'antenna': antena.toJson()
      };
}
