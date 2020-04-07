import 'dart:core';

import 'municipio_model.dart';
//import 'municipio_model.dart';

class Torre {
  int idTorre;
  String nombre;
  String identificacion;
  String direccion;
  String coordenadas;
  String altura;
  String tecnologia;
  Municipio municipio;

  Torre(
      {this.idTorre,
      this.nombre,
      this.identificacion,
      this.direccion,
      this.coordenadas,
      this.altura,
      this.tecnologia,
      this.municipio});

  factory Torre.fromJson(Map<String, dynamic> parsedJson) {
    return Torre(
      idTorre: parsedJson['idTorre'],
      nombre: parsedJson['nombre'],
      identificacion: parsedJson['identificacion'],
      direccion: parsedJson['direccion'],
      coordenadas: parsedJson['coordenadas'],
      altura: parsedJson['altura'],
      tecnologia: parsedJson['tecnologia'],
      municipio: Municipio.fromJson(parsedJson['municipio'])
    );
  }

  Map<String, dynamic> toJson() => {
        'idTorre': idTorre,
        'nombre': nombre,
        'identificacion': identificacion,
        'direccion': direccion,
        'coordenadas': coordenadas,
        'altura': altura,
        'tecnologia': tecnologia,
        'municipio': municipio.toJson()
      };
}
