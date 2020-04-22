import 'package:tenic_api/modelo/antena_model.dart';

class Observation {

  int id;
  String fecha; //Date
  String orientacion;
  String inclinacion;
  Antena antenna;

  Observation({this.id, this.fecha, this.orientacion, this.inclinacion, this.antenna});

  
  factory Observation.fromJson(Map<String, dynamic> parsedJson) {
    return Observation(
      id: parsedJson['id'],
      fecha: parsedJson['fecha'],
      orientacion: parsedJson['orientacion'],
      inclinacion: parsedJson['inclinacion'],
      antenna: Antena.fromJson(parsedJson['antenna'])
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'fecha': fecha,
        'orientacion': orientacion,
        'inclinacion': inclinacion,
        'antenna': antenna.toJson()
      };
}