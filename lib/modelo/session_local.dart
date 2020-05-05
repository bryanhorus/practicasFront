class Session {
  String accessToken;
  String rol;

  Session({this.accessToken, this.rol});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(accessToken: json['token'], rol: json['rol']);
  }

  Map<String, dynamic> toJson() => {'token': accessToken, 'rol': rol};

  Map<String, dynamic> refreshTokentoJson() => {'token': accessToken};
}
