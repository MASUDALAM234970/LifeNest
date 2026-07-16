import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifenest/app/feature/auth/model/Auth%20models.dart';

import '../../../core/networks/api_client.dart';
import '../../../core/conts/ApiException.dart';
import '../../../core/conts/endpoints.dart';
import '../../../routes/routes_name.dart';

// import '../../../routes/routes_name.dart';

class LoginPageController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool isPasswordHidden = true.obs;

  /// Show / Hide Password
  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
    try {
      print("Email: ${emailController.text.trim()}");
      print("Password: ${passwordController.text}");

      final request = UserLoginRequest(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      print("Request Body: ${request.toJson()}");

      final response = await ApiClient.instance.post(
        Endpoints.login,
        auth: false,
        body: request.toJson(),
      );

      print("Response: $response");

      // Save tokens (if your API returns them)
      await ApiClient.instance.saveTokens(
        access: response["data"]["tokens"]["access"],
        refresh: response["data"]["tokens"]["refresh"],
      );

      Get.snackbar(
        "Success",
        "Login Successful",
        snackPosition: SnackPosition.BOTTOM,
      );

      // Navigate to Home
      Get.offAllNamed(RoutesName.home);

    } on ApiException catch (e) {
      Get.snackbar(
        "Login Failed",
        e.message,
        snackPosition: SnackPosition.BOTTOM,

      );
    } catch (e) {
      print("Login Error: $e");

      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }




  void forgot_screen() {
    // Get.toNamed(RoutesName.forgotPassword);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}