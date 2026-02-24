import 'package:get/get.dart';
import 'package:lifenest/app/feature/Onboarding/screen/Onboarding_one.dart';
import 'package:lifenest/app/feature/Onboarding/screen/Onboarding_three.dart';
import 'package:lifenest/app/feature/Onboarding/screen/Onboarding_two.dart';
import 'package:lifenest/app/feature/auth/screens/CountryPicker.dart';
import 'package:lifenest/app/feature/auth/screens/Forgot_Password.dart';
import 'package:lifenest/app/feature/auth/screens/LoginPage.dart';
import 'package:lifenest/app/feature/auth/screens/RegisterPage.dart';
import 'package:lifenest/app/feature/auth/screens/gender.dart';
import 'package:lifenest/app/routes/routes_name.dart';

import '../feature/Onboarding/screen/onboarding_view.dart';

class RoutesPage {
  static final List<GetPage> pages = [
    GetPage(
      name: RoutesName.onboarding,
      page: () => const OnboardingView(),
      transition: Transition.fade,
    ),

    GetPage(
      name: RoutesName.onboarding_one,
      page: () => OnboardingOne(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutesName.onboarding_two,
      page: () => OnboardingTwo(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutesName.onboarding_three,
      page: () => OnboardingThree(),
      transition: Transition.fadeIn,
    ),
    // auth
    GetPage(
      name: RoutesName.login,
      page: () => Loginpage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutesName.ForgotPassword,
      page: () => ForgotPassword(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutesName.register,
      page: () => Registerpage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutesName.gender,
      page: () => Gender(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutesName.country,
      page: () =>  SelectCountryScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
