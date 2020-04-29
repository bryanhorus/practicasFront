
class Session {
  String accessToken;
  String rol;
  //List<Role> roles;

  Session(
      {this.accessToken, this.rol});

  factory Session.fromJson(Map<String, dynamic> json) {
    //var role = json['rol'] as List; //parsedJson
    //List<Role> imagesList = role != null ? role.map((i) => Role.fromJson(i)).toList() : null;
    return Session(
      accessToken: json['token'],
      rol: json['rol']
    );
  }

  Map<String, dynamic> toJson() => {
    'token': accessToken,
    'rol': rol
  };

  Map<String, dynamic> refreshTokentoJson() => {
    'token': accessToken
  };
}
