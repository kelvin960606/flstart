import 'package:flstart/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Splash Screen'),
            Button(
                label: 'Go Home',
                onPressed: () {
                  Get.toNamed('/home');
                }),
          ],
        ),
      ),
    );
  }
}
