import 'package:get/get.dart';
import 'package:lifenest/app/feature/Onboarding/controller/OnboardingController.dart';
import 'package:lifenest/app/feature/auth/controller/CurrentMoodController.dart';
import 'package:lifenest/app/feature/auth/controller/ForgotController.dart';
import 'package:lifenest/app/feature/auth/controller/LoginPageController.dart';
import 'package:lifenest/app/feature/home/controller/HomeController.dart';
import 'package:lifenest/app/feature/mind/controller/MindController.dart';

import '../../feature/auth/controller/SelectCountryController.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() => LoginPageController(), fenix: true);
    Get.lazyPut<OnboardingController>(
      () => OnboardingController(),
      fenix: true,
    );
    Get.lazyPut<ForgotController>(() => ForgotController(), fenix: true);
    Get.lazyPut<SelectCountryController>(
      () => SelectCountryController(),
      fenix: true,
    );
    Get.lazyPut<CurrentMoodController>(
      () => CurrentMoodController(),
      fenix: true,
    );

    Get.lazyPut<Homecontroller>(() => Homecontroller(), fenix: true);

    Get.lazyPut<MindController>(() => MindController(), fenix: true);
  }
}
