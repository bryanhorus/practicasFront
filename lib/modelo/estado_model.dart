class Estado {
  String estado;

  Estado({this.estado});

  factory Estado.fromJson(Map<String, dynamic> parsedJson) {
    return Estado(
      estado: parsedJson['estado'],
    );
  }

  Map<String, dynamic> toJson() => {'estado': estado};
}
