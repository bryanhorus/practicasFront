import 'package:tenic_api/modelo/tipo_usuario_model.dart';

class Usuario {
  String nombre;
  String apellido;
  String correo;
  String password;
  String telefono;
  TipoUsuario tipoUsuario;

  Usuario(
      {this.nombre,
      this.apellido,
      this.correo,
      this.password,
      this.telefono,
      this.tipoUsuario});

  factory Usuario.fromJson(Map<String, dynamic> parsedJson) {
    return Usuario(
      nombre: parsedJson['nombre'],
      apellido: parsedJson['apellido'],
      correo: parsedJson['correo'],
      password: parsedJson['password'],
      telefono: parsedJson['telefono'],
      tipoUsuario: TipoUsuario.fromJson(parsedJson['tipoUsuario']),
    );
  }

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'apellido': apellido,
        'correo': correo,
        'password': password,
        'telefono': telefono,
        'tipoUsuario': tipoUsuario.toJson(),
      };
}
