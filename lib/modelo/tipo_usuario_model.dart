class TipoUsuario {
  int idTipo;
  String descripcion;

  TipoUsuario({this.descripcion,this.idTipo});

  factory TipoUsuario.fromJson(Map<String, dynamic> parsedJson) {
    return TipoUsuario(
      idTipo: parsedJson['id_tipo_usuario'],
      descripcion: parsedJson['descripcion'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id_tipo_usuario':idTipo,
        'descripcion': descripcion,
      };
}
