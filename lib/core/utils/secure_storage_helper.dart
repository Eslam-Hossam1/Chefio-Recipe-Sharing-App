import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  final FlutterSecureStorage secureStorage;

  SecureStorageHelper(this.secureStorage);

  // Save data with type-specific handling
  Future<void> setData({required String key, required String value}) async {
    try {
      await secureStorage.write(key: key, value: value);
    } catch (e) {
      // Handle errors if needed
    }
  }

  // Get data
  Future<String?> getString(String key) async {
    try {
      return await secureStorage.read(key: key);
    } catch (e) {
      return null;
    }
  }

  // Delete a specific key
  Future<void> delete(String key) async {
    try {
      await secureStorage.delete(key: key);
    } catch (e) {
      // Handle errors if needed
    }
  }

  // Clear all stored data
  Future<void> clear() async {
    try {
      await secureStorage.deleteAll();
    } catch (e) {
      // Handle errors if needed
    }
  }
}
