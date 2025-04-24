import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:glide/core/utils/constants/prefs_keys.dart';

class TokenStorage {
  static final TokenStorage _instance = TokenStorage._internal();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  factory TokenStorage() => _instance;

  TokenStorage._internal();

  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: PrefKeys.accessToken, value: token);
  }

  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: PrefKeys.refreshToken, value: token);
  }

  Future<void> saveTokenType(String tokenType) async {
    await _storage.write(key: PrefKeys.tokenType, value: tokenType);
  }

  Future<void> saveExpiresIn(String expiresIn) async {
    await _storage.write(key: PrefKeys.expiresIn, value: expiresIn);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: PrefKeys.accessToken);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: PrefKeys.refreshToken);
  }

  Future<String?> getTokenType() async {
    return await _storage.read(key: PrefKeys.tokenType);
  }

  Future<String?> getExpiresIn() async {
    return await _storage.read(key: PrefKeys.expiresIn);
  }

  Future<void> clearTokens() async {
    await _storage.deleteAll();
  }
}
