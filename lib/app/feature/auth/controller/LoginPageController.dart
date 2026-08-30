import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifenest/app/feature/auth/screens/otp_screen.dart';
import '../../../core/model/Auth models.dart';
import '../../../core/networks/api_client.dart';
import '../../../core/conts/apiexception.dart';
import '../../../core/conts/endpoints.dart';
import '../../../routes/routes_name.dart';
import 'google_auth_controller.dart';

class LoginPageController extends GetxController {
  final GoogleAuthController googleAuthController = GoogleAuthController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool isPasswordHidden = true.obs;
  final RxBool isConfirmPasswordHidden = true.obs;

  /// Show / Hide Password
  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  ///login
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
        snackPosition: SnackPosition.TOP,
      );

      // Navigate to Home
      Get.offAllNamed(RoutesName.home);
    } on ApiException catch (e) {
      Get.snackbar("Login Failed", e.message, snackPosition: SnackPosition.TOP);
    } catch (e) {
      print("Login Error: $e");

      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.TOP);

      const Duration(seconds: 3);
    }
  }

  // register
  Future<void> register() async {
    if (nameController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please enter your name");
      return;
    }

    if (emailController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please enter your email");
      return;
    }

    if (dateOfBirthController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please enter your date of birth");
      Duration(seconds: 2);
      return;
    }

    final dob = dateOfBirthController.text.trim();

    final regex = RegExp(r'^(\d{4})-(\d{2})-(\d{2})$');

    final match = regex.firstMatch(dob);

    if (match == null) {
      Get.snackbar(
        "Error",
        "Date Must be YYYY-MM-DD",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      Duration(seconds: 3);
      return;
    }

    final year = int.parse(match.group(1)!);
    final month = int.parse(match.group(2)!);
    final day = int.parse(match.group(3)!);

    if (month < 1 || month > 12) {
      Get.snackbar(
        "Error",
        "Month must be between 1 and 12",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Duration(seconds: 3);
      return;
    }

    final lastDay = DateTime(year, month + 1, 0).day;

    if (day < 1 || day > lastDay) {
      Get.snackbar(
        "Error",
        "Invalid day for the selected month",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Duration(seconds: 3);
      return;
    }

    if (confirmPasswordController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please confirm your password",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Duration(seconds: 3);
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        "Error",
        "Passwords do not match",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Duration(seconds: 3);
      return;
    }

    isLoading.value = true;

    try {
      final request = UserRegistrationRequest(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        dateOfBirth: dateOfBirthController.text.trim(),
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );

      print("Registration Request: ${request.toJson()}");

      final response = await ApiClient.instance.post(
        Endpoints.signup,
        auth: false,
        body: request.toJson(),
      );

      print("Registration Response: $response");

      Get.snackbar(
        "Success",
        response["message"] ?? "Registration Successful",
        snackPosition: SnackPosition.TOP,
      );

      Get.to(
        () => OtpScreen(),
        arguments: {
          "email": emailController.text.trim(),
          "password": passwordController.text,
        },
      );
      // Go to Login Screen
      // Get.offAllNamed(RoutesName.login);
    } on ApiException catch (e) {
      Get.snackbar(
        "Registration Failed",
        e.message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      Get.to(() => OtpScreen(), arguments: emailController.text.trim());
    }
  }

  // Auto
  Future<void> autoLogin() async {
    try {
      final request = UserLoginRequest(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      print("Auto Login Request: ${request.toJson()}");

      final response = await ApiClient.instance.post(
        Endpoints.login,
        auth: false,
        body: request.toJson(),
      );

      print("Auto Login Response: $response");

      await ApiClient.instance.saveTokens(
        access: response["data"]["tokens"]["access"],
        refresh: response["data"]["tokens"]["refresh"],
      );

      print("Auto Login Successful");

      Get.offAllNamed(RoutesName.gender);

    } on ApiException catch (e) {
      print("Auto Login Failed: ${e.message}");

      Get.snackbar(
        "Login Failed",
        e.message,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  // otp login
  // Future<void> verifyOtp({required String email, required String otp}) async {
  //   try {
  //     final request = VerifyOtpRequest(email: email, otp: otp);
  //
  //     final response = await ApiClient.instance.post(
  //       Endpoints.verifyOtp,
  //       auth: false,
  //       body: request.toJson(),
  //     );
  //
  //     Get.snackbar(
  //       "Success",
  //       response["message"] ?? "Account Verified",
  //       snackPosition: SnackPosition.TOP,
  //     );
  //     // 🔥 OTP verified → Auto Login
  //     await autoLogin();
  //
  //     Get.offAllNamed(RoutesName.gender);
  //   } on ApiException catch (e) {
  //     Get.snackbar(
  //       "Verification Failed",
  //       e.message,
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   }
  // }

  // send opt


  Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final request = VerifyOtpRequest(
        email: email,
        otp: otp,
      );

      final response = await ApiClient.instance.post(
        Endpoints.verifyOtp,
        auth: false,
        body: request.toJson(),
      );

      Get.snackbar(
        "Success",
        response["message"] ?? "Account Verified",
        snackPosition: SnackPosition.TOP,
      );

      // OTP verified
      await autoLogin();

    } on ApiException catch (e) {
      Get.snackbar(
        "Verification Failed",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


  Future<void> sendOtp(String email) async {
    try {
      final request = SendOtpRequest(email: email);

      final response = await ApiClient.instance.post(
        Endpoints.resendOtp,
        auth: false,
        body: request.toJson(),
      );

      Get.snackbar(
        "Success",
        response["message"],
        snackPosition: SnackPosition.TOP,
      );
    } on ApiException catch (e) {
      Get.snackbar("Failed", e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }

  // gender

  Future<void> updateGender(String gender) async {
    try {
      final response = await ApiClient.instance.patch(
        Endpoints.profile,
        body: {"gender": gender},
      );

      Get.snackbar(
        "Success",
        response["message"] ?? "Gender updated successfully",
        snackPosition: SnackPosition.TOP,
      );
      Get.toNamed(RoutesName.country);
    } on ApiException catch (e) {
      Get.snackbar("Failed", e.message, snackPosition: SnackPosition.TOP);
    } catch (e) {
      print(e);

      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.TOP);
    }
  }

  void forgot_screen() {
    // Get.toNamed(RoutesName.forgotPassword);
  }

  Future<void> googleLogin() async {
    try {
      final String? firebaseToken = await googleAuthController
          .signInWithGoogle();

      if (firebaseToken == null) {
        Get.snackbar(
          'Login Cancelled',
          'Google login was cancelled.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // Django API hit
      final response = await ApiClient.instance.post(
        Endpoints.firebaseAuth,
        body: {'firebase_token': firebaseToken},
        auth: false,
      );

      // JWT save
      await ApiClient.instance.saveTokens(
        access: response['data']['tokens']['access'],
        refresh: response['data']['tokens']['refresh'],
      );

      // Success Toast
      Get.snackbar(
        'Success',
        'Login successful!',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );

      // Go to Home
      await Future.delayed(const Duration(milliseconds: 500));

      Get.offAllNamed(RoutesName.home);
    } catch (e) {
      Get.snackbar(
        'Login Failed',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
      );

      print('Google Login Failed: $e');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    dateOfBirthController.dispose();
    nameController.dispose();
    super.onClose();
  }
}
