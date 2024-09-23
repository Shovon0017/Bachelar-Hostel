

import '../local storage/local_storage.dart';

class LogOutApi {
  static Future<bool>logoutApi() async {
    await LocalStorage().deleteData();
      return true;
  }
}
