import 'dart:core';

class Torre {
  String nombreTorre;
  String identificacionTorre;
  String direccionTorre;
  String coordenadas;
  String altura;
  String tecnologia;
  Torre(
      {this.nombreTorre,
      this.identificacionTorre,
      this.direccionTorre,
      this.coordenadas,
      this.altura,
      this.tecnologia});

  factory Torre.fromJson(Map<String, dynamic> parsedJson) {
    return Torre(
      nombreTorre: parsedJson['nombre Torre'],
      identificacionTorre: parsedJson['indentificacion de torre'],
      direccionTorre: parsedJson['direccion Torre'],
      coordenadas: parsedJson['coordenadas'],
      altura: parsedJson['altura Torre'],
      tecnologia: parsedJson['tecnologia Torre'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nombre Torre': nombreTorre,
        'indentificacion de torre': identificacionTorre,
        'direccion Torre': direccionTorre,
        'coordenadas': coordenadas,
        'altura Torre': altura,
        'tecnologia Torre': tecnologia,
      };
}
