import 'package:get_storage/get_storage.dart';

class storage {
  static final box = GetStorage();
  static read(key) {
    return box.read(key);
  }

  static write(String key, value) {
    return box.write(key, value);
  }

  static remove(key) {
    return box.remove(key);
  }
}
