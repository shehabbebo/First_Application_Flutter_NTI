import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MyNavigator {
  static goTo({
    required screen,
    bool isReplace = false,
    Transition transition = Transition.rightToLeftWithFade,
    Duration? duration,
  }) {
    if (isReplace) {
      Get.offAll(
        screen,
        transition: Transition.rightToLeftWithFade,
        duration: duration ?? Duration(seconds: 1),
      );
    } else {
      Get.to(
        screen,
        transition: Transition.rightToLeftWithFade,
        duration: duration ?? Duration(seconds: 1),
      );
    }
  }
}
