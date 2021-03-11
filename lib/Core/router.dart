import 'package:flstart/Pages/home.dart';
import 'package:flstart/Pages/splash.dart';
import 'package:get/route_manager.dart';

var pages = [
  GetPage(name: '/', page: () => Splash()),
  GetPage(name: '/home', page: () => Home()),
];
