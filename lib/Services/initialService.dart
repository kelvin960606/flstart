import 'package:flstart/Controllers/authController.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'apiService.dart';

void initServices() async {
  await Get.putAsync(() => GetStorage.init());
  final AuthController auth = Get.put(AuthController());
  auth.init();
  Get.put(() => ApiService().init());
}
