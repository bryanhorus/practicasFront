import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tenic_api/modelo/LoginUser.dart';
import 'package:tenic_api/modelo/session_local.dart';
import 'package:tenic_api/resource/constants.dart';


class LoginApiService {
  LoginApiService();

  Session _session;

  Future<Session> iniciarSesion(Login login) async {
    var body2 = json.encode(login.toJson());
    Uri uri = Uri.http(Constants.urlAuthority, Constants.pathServiceLogin);
    var res = await http.post(uri,
        headers: {HttpHeaders.contentTypeHeader: Constants.contenTypeHeader},
        body: body2);

    var resBody = json.decode(res.body);
    _session = Session.fromJson(resBody);

    if (res.statusCode == 200) {
      print("token " + _session.accessToken);

      return _session;
    }
    return _session;
  }

}
