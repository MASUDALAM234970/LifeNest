import 'package:get/get.dart';
import 'package:lifenest/app/feature/Onboarding/controller/OnboardingController.dart';
import 'package:lifenest/app/feature/auth/controller/ForgotController.dart';
import 'package:lifenest/app/feature/auth/controller/LoginPageController.dart';

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
    Get.lazyPut<SelectCountryController>(() => SelectCountryController(), fenix: true);
  }
}
