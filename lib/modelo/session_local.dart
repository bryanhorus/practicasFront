class Session {
  String accessToken;
  String rol;
  String nombre;
  String apellido;
  String telefono;
  String correo;

  Session({this.accessToken, this.rol, this.nombre, this.apellido, this.telefono, this.correo});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(accessToken: json['token'], rol: json['rol'], nombre: json['nombre'], telefono: json['tel'], apellido: json['apellido'], correo: json['correo']);
  }

  Map<String, dynamic> toJson() => {'token': accessToken, 'rol': rol, 'nombre': nombre, 'tel': telefono, 'apellido': apellido, 'correo': correo};

  Map<String, dynamic> refreshTokentoJson() => {'token': accessToken};
}
