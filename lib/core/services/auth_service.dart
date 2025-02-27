import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final String _tokenKey = "user_token";

  /// 🔐 Guarda el token de autenticación en almacenamiento seguro
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  /// 🔐 Obtiene el token almacenado
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  /// 🔐 Elimina el token cuando el usuario cierra sesión
  Future<void> removeToken() async {
    await _storage.delete(key: _tokenKey);
  }

  /// ✅ Método `isAuthenticated` para verificar si hay un token válido almacenado
  Future<bool> isAuthenticated() async {
    String? token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
