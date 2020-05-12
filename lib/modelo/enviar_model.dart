class Correo {
  String body;
  String asunto;
  List<String> correo; 
  

  Correo({this.body, this.asunto, this.correo});

  factory Correo.fromJson(Map<String, dynamic> parsedJson) {
    var correoFromJson = parsedJson['to'];
    List<String> correoList = correoFromJson.cast<String>();
    return Correo(
      body: parsedJson['body'],
      asunto: parsedJson['subject'],
      correo: correoList
    );
  }

  Map<String, dynamic> toJson() => {
    'body': body,
    'subject': asunto,
    'to': correo,
};
}
