import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/OnboardingController.dart';
import 'onboarding_one.dart';
import 'onboarding_two.dart';
import 'onboarding_three.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(OnboardingController()); // ✅ only one controller

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: c.next, // ✅ tap করলে next
      child: PageView(
        controller: c.pageController,
        onPageChanged: c.onChanged,
        children: const [
          OnboardingOne(),
          OnboardingTwo(),
          OnboardingThree(),
        ],
      ),
    );
  }
}