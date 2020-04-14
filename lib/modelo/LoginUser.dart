class LoginUser {
  int idUser;
  String correo;
  String password;
  String token;
  String nombre;

  LoginUser({this.correo, this.password, this.token, this.nombre, this.idUser});

  factory LoginUser.fromJson(Map<String, dynamic> parsedJson) {
    return LoginUser(
        correo: parsedJson['correo'],
        password: parsedJson['password'],
        token: parsedJson['token'],
        nombre: parsedJson['nombre'],
        idUser: parsedJson['idUser']);
  }

  Map<String, dynamic> toJson() => {
        'correo': correo,
        'password': password,
        'token': token,
        'nombre': nombre,
        'idUser': idUser
      };
}
