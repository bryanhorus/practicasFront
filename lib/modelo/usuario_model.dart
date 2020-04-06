import 'package:tenic_api/modelo/tipo_usuario_model.dart';

class Usuario {
  int idUsuario;
  String nombre;
  String apellido;
  String correo;
  String password;
  String telfono;
  TipoUsuario typeUser;

  Usuario(
      {this.idUsuario,
        this.nombre,
        this.apellido,
        this.correo,
        this.password,
        this.telfono,
        this.typeUser});

  factory Usuario.fromJson(Map<String, dynamic> parsedJson) {
    return Usuario(
        idUsuario: parsedJson['idUsuario'],
        nombre: parsedJson['nombre'],
        apellido: parsedJson['apellido'],
        correo: parsedJson['correo'],
        password: parsedJson['password'],
        telfono: parsedJson['telfono'],
        typeUser: TipoUsuario.fromJson(parsedJson['typeUser'])
    );
  }

  Map<String, dynamic> toJson() => {
    'idUsuario' : idUsuario,
    'nombre': nombre,
    'apellido': apellido,
    'correo': correo,
    'password': password,
    'telfono': telfono,
    'typeUser': typeUser.toJson()
  };
}
