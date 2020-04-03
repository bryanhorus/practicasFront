class TipoUsuario {
  int idTipo;
  String descripcion;

  TipoUsuario({this.descripcion,this.idTipo});

  factory TipoUsuario.fromJson(Map<String, dynamic> parsedJson) {
    return TipoUsuario(
      idTipo: parsedJson['idTipo'],
      descripcion: parsedJson['descripcion'],
    );
  }

  Map<String, dynamic> toJson() => {
        'idTipo':idTipo,
        'descripcion': descripcion
      };
}
