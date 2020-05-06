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
    await _storage.delete(key: 'rol');
  }

  Future deleteAllValues() async {
    await _storage.deleteAll();
  }

  Future writeValue(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future saveSessionStorage(Session session) async {
    await _storage.write(key: 'accessToken', value: session.accessToken);
    await _storage.write(key: 'rol', value: session.rol);
    await _storage.write(key: 'nombre', value: session.nombre);
    await _storage.write(key: 'telefono', value: session.telefono);
    await _storage.write(key: 'apellido', value: session.apellido);
  }

  Future<String> getToken() async {
    final String token = await _storage.read(key: 'accessToken');
    print(token);
    return token;
  }

  Future<String> getRol() async {
    final String rol = await _storage.read(key: 'rol');
    print("****" + rol);
    return rol;
  }

  Future<String> getNombre() async {
    final String nombre = await _storage.read(key: 'nombre');
    print("****" + nombre);
    return nombre;
  }

  Future<String> getTelefono() async {
    final String telefono = await _storage.read(key: 'telefono');
    print("****" + telefono);
    return telefono;
  }

  Future<String> getApellido() async {
    final String apellido = await _storage.read(key: 'apellido');
    print("****" + apellido);
    return apellido;
  }

  Future<String> getCorreo() async {
    final String correo = await _storage.read(key: 'correo');
    print("****" + correo);
    return correo;
  }
}
