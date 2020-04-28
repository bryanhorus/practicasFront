import 'package:tenic_api/modelo/tipo_usuario_model.dart';

class Usuario {
  int idUsuario;
  String nombre;
  String apellido;
  String correo;
  String password;
  String telfono;
  List<Role> roles;

  Usuario(
      {this.idUsuario,
      this.nombre,
      this.apellido,
      this.correo,
      this.password,
      this.telfono,
      this.roles});

  factory Usuario.fromJson(Map<String, dynamic> parsedJson) {

    var role = parsedJson['roles'] as List;
    List<Role> imagesList = role != null ? role.map((i) => Role.fromJson(i)).toList() : null;

    return Usuario(
        idUsuario: parsedJson['idUsuario'],
        nombre: parsedJson['nombre'],
        apellido: parsedJson['apellido'],
        correo: parsedJson['correo'],
        password: parsedJson['password'],
        telfono: parsedJson['telfono'],
        roles: imagesList
    );
  }

  Map<String, dynamic> toJson() => {
        'idUsuario': idUsuario,
        'nombre': nombre,
        'apellido': apellido,
        'correo': correo,
        'password': password,
        'telfono': telfono,
        'roles': roles != null ? roles.map((i) => i.toJson()).toList():null
      };


}
