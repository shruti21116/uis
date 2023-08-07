import 'package:get_storage/get_storage.dart';

class PrefrenceManager {
  static var box = GetStorage();

  static Future<void> addUserid(String id) async {
    await box.write("userid",id);
  }

  static getUserId() {
    return box.read('userid');
  }

  static eraseData() {
    return box.erase();
  }
}
