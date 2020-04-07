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
  Estado state;

  Antena(
      {this.idAntena,
      this.nombre,
      this.referencia,
      this.altura,
      this.orientacion,
      this.inclinacion,
<<<<<<< HEAD
      this.torre, 
      this.state});
=======
      this.state,
      this.torre});
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb

  factory Antena.fromJson(Map<String, dynamic> parsedJson) {
    return Antena(
      idAntena: parsedJson['idAntena'],
      nombre: parsedJson['nombre'],
      referencia: parsedJson['referencia'],
      altura: parsedJson['altura'],
      orientacion: parsedJson['orientacion'],
      inclinacion: parsedJson['inclinacion'],
<<<<<<< HEAD
      torre: Torre.fromJson(parsedJson['torre']),
      state: Estado.fromJson(parsedJson['estado'])

=======
      state: Estado.fromJson(parsedJson['state']),
      torre: Torre.fromJson(parsedJson['torre'])
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
    );
  }

  Map<String, dynamic> toJson() => {
        'idAntena': idAntena,
        'nombre': nombre,
        'referencia': referencia,
        'altura': altura,
        'orientacion': orientacion,
        'inclinacion': inclinacion,
<<<<<<< HEAD
        'torre': torre.toJson(),
        'estado': state.toJson()
=======
        'state': state.toJson(),
        'torre': torre.toJson()
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
      };
}
