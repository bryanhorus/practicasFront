import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';

class AsignarAntena {
  Usuario usuario;
  Antena antena;

  AsignarAntena({this.usuario, this.antena});

  factory AsignarAntena.fromJson(Map<String, dynamic> parsedJson) {
    return AsignarAntena(
        usuario: Usuario.fromJson(parsedJson['user']),
        antena: Antena.fromJson(parsedJson['antenna'])
        );
  }

  Map<String, dynamic> toJson() => {
        'user': usuario.toJson(),
        'antenna': antena.toJson()
      };
}
