import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  RxString token = ''.obs;
  SharedPreferences prefs;
  final box = GetStorage();

  Future init() async {
    prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('token');
    if (data != null) {
      updateToken(data);
    }
  }

  String getToken() {
    return token.value;
  }

  Future updateToken(data) async {
    token.value = data;
    box.write('token', data);
    await prefs.setString('token', data);
  }

  void deleteToken() async {
    token.value = '';
    box.remove('token');
    await prefs.remove('token');
  }

  bool isLogin() {
    return getToken() != null && getToken() != '' ? true : false;
  }
}
