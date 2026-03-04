import 'package:get/get.dart';
class Homecontroller extends GetxController {

  final RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}