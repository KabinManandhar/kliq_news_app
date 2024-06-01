import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageKeys {
  static String get access => 'accessToken';
  static String get refresh => 'refreshToken';
  static String get username => 'username';
  static String get user => 'user';
  static String get isFirstTime => 'isFirstTime';
}

class LocalStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  write({required dynamic key, required dynamic value}) async {
    try {
      await storage.write(key: key, value: value);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> read({required dynamic key}) async {
    try {
      return await storage.read(key: key);
    } catch (e) {
      rethrow;
    }
  }

  readAll() async {
    try {
      return await storage.readAll();
    } catch (e) {
      rethrow;
    }
  }

  delete({required dynamic key}) async {
    try {
      await storage.delete(key: key);
    } catch (e) {
      rethrow;
    }
  }

  deleteAll() async {
    try {
      await storage.deleteAll();
    } catch (e) {
      rethrow;
    }
  }
}
