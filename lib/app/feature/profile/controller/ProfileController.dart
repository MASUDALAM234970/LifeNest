import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/conts/endpoints.dart';
import '../../../core/networks/api_client.dart';
import '../../../routes/routes_name.dart';
import '../screens/UserProfile.dart';

class ProfileController extends GetxController {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final Rxn<UserProfile> userProfile = Rxn<UserProfile>();

  final RxBool isLoading = false.obs;
  final ImagePicker _picker = ImagePicker();

  final Rxn<File> selectedProfileImage = Rxn<File>();
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final ageController = TextEditingController();
  final occupationController = TextEditingController();

  final RxString gender = "".obs;

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
        userProfile.value = UserProfile.fromJson(response["data"]);

        nameController.text = userProfile.value?.name ?? "";

        dobController.text = userProfile.value?.dateOfBirth ?? "";
        ageController.text = userProfile.value?.age?.toString() ?? "";
        occupationController.text = userProfile.value?.occupation ?? "";

        gender.value = userProfile.value?.gender ?? "";
      } else {
        Get.snackbar("Error", response["message"] ?? "Failed to load profile");
      }
    } catch (e) {
      print("Profile Error: $e");

      Get.snackbar("Error", "Failed to load profile");
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> updateProfile() async {
  //   try {
  //     isLoading.value = true;
  //
  //     final body = {
  //       "name": nameController.text.trim(),
  //       "date_of_birth": dobController.text.trim(),
  //       "age": int.tryParse(ageController.text.trim()),
  //       "gender": gender.value,
  //       "occupation": occupationController.text.trim(),
  //     };
  //
  //     print("Update Profile Request: $body");
  //
  //     final response = await ApiClient.instance.put(
  //       Endpoints.profile,
  //       auth: true,
  //       body: body,
  //     );
  //
  //     print("Update Profile Response: $response");
  //
  //     if (response["success"] == true) {
  //       Get.snackbar(
  //         "Success",
  //         response["message"] ?? "Profile updated successfully",
  //         snackPosition: SnackPosition.TOP,
  //       );
  //
  //       // নতুন data আবার load করবে
  //       await profile(forceRefresh: true);
  //
  //       // Edit page থেকে Profile page-এ ফিরে যাবে
  //       // Get.offAllNamed(RoutesName.home);
  //     } else {
  //       Get.snackbar(
  //         "Error",
  //         response["message"] ?? "Profile update failed",
  //         snackPosition: SnackPosition.TOP,
  //       );
  //     }
  //   } catch (e) {
  //     print("Update Profile Error: $e");
  //
  //     Get.snackbar(
  //       "Error",
  //       "Failed to update profile",
  //       snackPosition: SnackPosition.TOP,
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }



  Future<void> pickProfileImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 1080,
        maxHeight: 1080,
      );

      if (image != null) {
        selectedProfileImage.value = File(image.path);

        print(
          "Selected Profile Image: ${selectedProfileImage.value!.path}",
        );
      }
    } catch (e) {
      print("Pick Image Error: $e");

      Get.snackbar(
        "Error",
        "Failed to select image",
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> updateProfile() async {
    try {
      isLoading.value = true;

      final fields = {
        "name": nameController.text.trim(),
        "date_of_birth": dobController.text.trim(),
        "age": ageController.text.trim(),
        "gender": gender.value,
        "occupation": occupationController.text.trim(),
      };

      print("Update Profile Fields: $fields");

      print(
        "Selected Image: ${selectedProfileImage.value?.path ?? "No Image"}",
      );

      final response = await ApiClient.instance.putMultipart(
        Endpoints.profile,
        auth: true,
        fields: fields,
        filePath: selectedProfileImage.value?.path,
        fileField: "profile_picture",
      );

      print("Update Profile Response: $response");

      if (response["success"] == true) {
        // Backend থেকে নতুন profile আবার load
        await profile(forceRefresh: true);

        // Selected local image clear
        selectedProfileImage.value = null;

        Get.snackbar(
          "Success",
          response["message"] ?? "Profile updated successfully",
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          "Error",
          response["message"] ?? "Profile update failed",
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      print("Update Profile Error: $e");

      Get.snackbar(
        "Error",
        "Failed to update profile",
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      final refreshToken = await _storage.read(key: "refresh_token");

      if (refreshToken == null || refreshToken.isEmpty) {
        Get.snackbar("Error", "Refresh token is missing");
        return;
      }

      final response = await ApiClient.instance.post(
        Endpoints.logout,
        auth: true,
        body: {"refresh": refreshToken},
      );

      if (response["success"] == true) {
        await _storage.delete(key: "access_token");
        await _storage.delete(key: "refresh_token");

        Get.snackbar("Success", response["message"] ?? "Logout successful");

        Get.offAllNamed(RoutesName.login);
      } else {
        Get.snackbar("Error", response["message"] ?? "Logout failed");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
