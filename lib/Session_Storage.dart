import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'modelo/session_local.dart';

class SessionStorage {

  static final _storage = FlutterSecureStorage();
  final Session session = Session();

  Future<Map<String, String>> getAllValues() async {
    return await _storage.readAll();
  }

  Future<String> getValueforKey(String key) async {
    return await _storage.read(key: key);
  }

  Future deleteValue(String key) async {
    await _storage.delete(key: key);
  }

  Future deleteAllValues() async {
    await _storage.deleteAll();
  }

  Future writeValue(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future saveSessionStorage(Session session) async {
    await _storage.write(key: 'accessToken', value: session.accessToken);

  }

  Future<String> getToken() async {
    final String token = await _storage.read(key:'accessToken');
    print(token);
    return token;
  }
}