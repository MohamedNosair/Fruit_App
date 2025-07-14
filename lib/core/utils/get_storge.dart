import 'package:get_storage/get_storage.dart';

class storage {
   static final  box = GetStorage();
  static Future<void> initGetStorge() async {
    await GetStorage.init();
  }

 
  static read(String key) {
  return  box.read(key) ?? false;
  }
  
  static write(String key, bool value) {
    box.write(key, value);
  }


}
