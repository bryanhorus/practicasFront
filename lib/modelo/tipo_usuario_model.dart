class Role {
  int idTipo;
  String descripcion;

  Role({this.descripcion, this.idTipo});

  factory Role.fromJson(Map<String, dynamic> parsedJson) {
    return Role(
        idTipo: parsedJson['idTipo'], descripcion: parsedJson['descripcion']);
  }

  Map<String, dynamic> toJson() =>
      {'idTipo': idTipo, 'descripcion': descripcion};
}
