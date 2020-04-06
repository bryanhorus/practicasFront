class Estado {
  int id;
  String estado;

  Estado({this.id, this.estado});

  factory Estado.fromJson(Map<String, dynamic> parsedJson) {
    return Estado(
      estado: parsedJson['estado'],
    );
  }

  Map<String, dynamic> toJson() => {'estado': estado};
}
