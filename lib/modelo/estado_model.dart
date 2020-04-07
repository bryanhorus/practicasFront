class Estado {
  int id;
  String estado;

<<<<<<< HEAD
  Estado({this.id, this.estado});
=======
  Estado({this.id,this.estado});
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb

  factory Estado.fromJson(Map<String, dynamic> parsedJson) {
    return Estado(
      id: parsedJson['id'],
<<<<<<< HEAD
      estado: parsedJson['estado'],
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'estado': estado};
=======
      estado: parsedJson['estado']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'estado': estado};
>>>>>>> 13b45c8617b06d2310ccf6815e96a91fad45a1fb
}
