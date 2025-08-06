import 'package:get_storage/get_storage.dart';

class storage {
  static Future<void> initGetStorge() async {
    await GetStorage.init();
  }

  static final box = GetStorage();
  static read(key) {
    return box.read(key);
  }

  static write(String key, value) {
    box.write(key, value);
  }

  static remove(key) {
    box.remove(key);
  }
}
