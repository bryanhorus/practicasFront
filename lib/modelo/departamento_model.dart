class Departamento {
  int idDpto;
  String nombre;

  Departamento({this.nombre, this.idDpto});

  factory Departamento.fromJson(Map<String, dynamic> parsedJson) {
    return Departamento(
      nombre: parsedJson['nombre'],
      idDpto: parsedJson['idDpto'],
    );
  }

  Map<String, dynamic> toJson() => {'nombre': nombre, 'idDpto': idDpto};
}
