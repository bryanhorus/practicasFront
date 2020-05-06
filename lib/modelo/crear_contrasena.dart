class Contrasena {
  int id;
  String newPassword;

  Contrasena({this.id, this.newPassword});

  factory Contrasena.fromJson(Map<String, dynamic> parsedJson) {
    return Contrasena(
      id: parsedJson['id'],
      newPassword: parsedJson['newPassword']
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'newPassword': newPassword
      };
}
