import 'dart:math';

import 'package:flutter/material.dart';

double h(context, percentage) {
  return MediaQuery.of(context).size.height * percentage;
}

double w(context, percentage) {
  return MediaQuery.of(context).size.width * percentage;
}

int random(min, max) {
  var rn = new Random();
  return min + rn.nextInt(max - min);
}
