// ignore_for_file: constant_identifier_names

import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write("token", token);
    return true;
  }

  Future<bool> saveUser(String value) async {
    final box = GetStorage();
    await box.write("user", value);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read("token");
  }

  String? getUser() {
    final box = GetStorage();
    return box.read("user");
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove("token");
  }

  Future<void> removeUser() async {
    final box = GetStorage();
    await box.remove("user");
  }
}

enum CacheManagerKey { TOKEN }
