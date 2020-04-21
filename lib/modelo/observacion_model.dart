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
      idObservacion: parsedJson['id_observacion'],
      fecha: parsedJson['ob_fecha'],
      orientacion: parsedJson['ob_orientacion'],
      inclinacion: parsedJson['ob_inclinacion'],
      antena: Antena.fromJson(parsedJson['antena'])
    );
  }

  Map<String, dynamic> toJson() => {
        'id_observacion': idObservacion,
        'ob_fecha': fecha,
        'ob_orientacion': orientacion,
        'ob_inclinacion': inclinacion,
        'antena': antena.toJson()
      };
}
