import 'package:get_storage/get_storage.dart';

class UserData {
  final getData = GetStorage();
  save(key, val) {
    final data = GetStorage();
    data.write(key, "val");
  }

 saveLoginData(String key, String value) {
    getData.write(key, value);
  }

  String getLoginData(String key) {
    String resp = getData.read(key);
    return resp;
   
  }

  saveUserData(String key, String value) {
    getData.write(key, value);
  }

  String getUserData(String key) {
    String resp = getData.read(key);
    return resp;
  }
}
