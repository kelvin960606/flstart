import 'package:flstart/Controllers/authController.dart';
import 'package:flstart/Utils/common.dart';
import 'package:flstart/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final AuthController controller = Get.find();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Screen'),
            Obx(
              () => Container(
                color: Colors.blueGrey,
                width: w(context, 0.3),
                height: h(context, 0.05),
                child:
                    Center(child: Text(controller.token.value ?? 'No Token')),
              ),
            ),
            Button(
                label: 'Update Token',
                onPressed: () {
                  var num = random(1, 100);
                  controller.updateToken(num.toString());
                }),
          ],
        ),
      ),
    );
  }
}
