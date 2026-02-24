import 'package:get/get.dart';

class SelectCountryController extends GetxController {
  final selectedName = 'United States'.obs;
  final selectedCode = 'US'.obs;
  final selectedFlagEmoji = '🇺🇸'.obs;

  void setCountry({required String name, required String code, required String flagEmoji}) {
    selectedName.value = name;
    selectedCode.value = code;
    selectedFlagEmoji.value = flagEmoji;
  }
}