// ignore_for_file: constant_identifier_names

import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write("token", token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read("token");
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove("token");
  }
}

enum CacheManagerKey { TOKEN }
