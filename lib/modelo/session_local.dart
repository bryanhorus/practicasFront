class Session {
  String accessToken;
  String rol;
  String nombre;
  String telefono;

  Session({this.accessToken, this.rol, this.nombre, this.telefono});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(accessToken: json['token'], rol: json['rol'], nombre: json['nombre'], telefono: json['telefono']);
  }

  Map<String, dynamic> toJson() => {'token': accessToken, 'rol': rol, 'nombre': nombre, 'telefono': telefono};

  Map<String, dynamic> refreshTokentoJson() => {'token': accessToken};
}
