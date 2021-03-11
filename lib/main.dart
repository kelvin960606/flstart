import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Core/router.dart';
import 'Services/initialService.dart';

void main() {
  initServices();
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: pages,
      routingCallback: (routing) {
        if (routing.current == '/home') {
          // do something
        }
      }));
}
