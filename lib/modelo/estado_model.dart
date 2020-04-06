class Estado {
  int idEstado;
  String estado;

  Estado({this.idEstado,this.estado});

  factory Estado.fromJson(Map<String, dynamic> parsedJson) {
    return Estado(
      idEstado: parsedJson['id'],
      estado: parsedJson['estado'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': idEstado,
    'estado': estado};
}
