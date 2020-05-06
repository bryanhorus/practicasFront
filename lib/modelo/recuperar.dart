class Recuperar {
  String correo;
  String telefono;

  Recuperar({this.correo, this.telefono});

  factory Recuperar.fromJson(Map<String, dynamic> parsedJson) {
    return Recuperar(
      correo: parsedJson['email'],
      telefono: parsedJson['telefono'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': correo,
        'telefono': telefono,
      };
}
