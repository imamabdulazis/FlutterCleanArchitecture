import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future writeData(String key, dynamic value) async {
    final writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

  Future readData(String key) async {
    final readData = await _storage.read(key: key);
    return readData;
  }

  Future deleteData(String key) async {
    final deleteData = await _storage.delete(key: key);
    return deleteData;
  }
}
