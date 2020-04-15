class Login {
  String correo;
  String password;

  Login({this.correo, this.password});

  factory Login.fromJson(Map<String, dynamic> parsedJson) {
    return Login(
      correo: parsedJson['correo'],
      password: parsedJson['password'],

    );
  }

  Map<String, dynamic> toJson() =>
      {
        'correo': correo,
        'password': password,
      };
}

