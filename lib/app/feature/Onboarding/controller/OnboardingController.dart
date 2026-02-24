import 'package:get/get.dart';
import 'package:lifenest/app/routes/routes_name.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController {
  void skip() {
    Get.offAllNamed(RoutesName.login);
  }

  // void continue_one() {
  //   Get.toNamed(RoutesName.onboarding_one);
  // }

  void continue_two() {
    Get.toNamed(RoutesName.onboarding_two);
  }

  void continue_three() {
    Get.toNamed(RoutesName.onboarding_three);
  }

  final pageController = PageController();
  final index = 0.obs;

  void onChanged(int i) => index.value = i;

  void next() {
    if (index.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // শেষ হলে রুট
      // Get.offAllNamed(RoutesName.auth);
    }
  }

  // void skip() {
  //   // Get.offAllNamed(RoutesName.auth);
  // }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }



}
