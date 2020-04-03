import 'package:tenic_api/modelo/tipo_usuario_model.dart';

class Usuario {
  String nombre;
  String apellido;
  String correo;
  String password;
  String telfono;
  TipoUsuario typeUser;

  Usuario(
      {this.nombre,
        this.apellido,
        this.correo,
        this.password,
        this.telfono,
        this.typeUser});

  factory Usuario.fromJson(Map<String, dynamic> parsedJson) {
    return Usuario(
        nombre: parsedJson['nombre'],
        apellido: parsedJson['apellido'],
        correo: parsedJson['correo'],
        password: parsedJson['password'],
        telfono: parsedJson['telfono'],
        typeUser: TipoUsuario.fromJson(parsedJson['typeUser'])
    );
  }

  Map<String, dynamic> toJson() => {
    'nombre': nombre,
    'apellido': apellido,
    'correo': correo,
    'password': password,
    'telfono': telfono,
    'typeUser': typeUser.toJson()
  };
}
