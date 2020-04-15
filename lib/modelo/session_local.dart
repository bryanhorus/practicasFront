class Session {
  String accessToken;

  Session(
      {this.accessToken
       });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      accessToken: json['token']
    );
  }

  Map<String, dynamic> toJson() => {
    'token': accessToken
  };

  Map<String, dynamic> refreshTokentoJson() => {
    'token': accessToken
  };
}
