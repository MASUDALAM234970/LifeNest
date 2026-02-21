import 'package:get/get.dart';
import 'package:lifenest/app/feature/auth/controller/LoginPageController.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() => LoginPageController());
  }
}
