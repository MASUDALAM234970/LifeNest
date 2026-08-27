import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../core/conts/endpoints.dart';
import '../../../core/networks/api_client.dart';
import '../../../routes/routes_name.dart';
import '../screens/UserProfile.dart';

class ProfileController extends GetxController {
  final FlutterSecureStorage _storage =
  const FlutterSecureStorage();
  final Rxn<UserProfile> userProfile = Rxn<UserProfile>();

  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    profile();
  }
  Future<void> profile({bool forceRefresh = false}) async {
    // Data already loaded থাকলে আবার API call করবে না
    if (!forceRefresh && userProfile.value != null) {
      return;
    }

    try {
      isLoading.value = true;

      final response = await ApiClient.instance.get(
        Endpoints.profile,
        auth: true,
      );

      if (response["success"] == true) {
        userProfile.value = UserProfile.fromJson(
          response["data"],
        );
      } else {
        Get.snackbar(
          "Error",
          response["message"] ?? "Failed to load profile",
        );
      }
    } catch (e) {
      print("Profile Error: $e");

      Get.snackbar(
        "Error",
        "Failed to load profile",
      );
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> logout() async {
    try {
      final refreshToken =
      await _storage.read(key: "refresh_token");

      if (refreshToken == null || refreshToken.isEmpty) {
        Get.snackbar("Error", "Refresh token is missing");
        return;
      }

      final response = await ApiClient.instance.post(
        Endpoints.logout,
        auth: true,
        body: {
          "refresh": refreshToken,
        },
      );

      if (response["success"] == true) {
        await _storage.delete(key: "access_token");
        await _storage.delete(key: "refresh_token");

        Get.snackbar(
          "Success",
          response["message"] ?? "Logout successful",
        );

        Get.offAllNamed(RoutesName.login);
      } else {
        Get.snackbar(
          "Error",
          response["message"] ?? "Logout failed",
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}