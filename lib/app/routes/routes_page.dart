import 'package:get/get.dart';
import 'package:lifenest/app/feature/journal/screens/JournalScreen.dart';
import 'package:lifenest/app/feature/Onboarding/screen/Onboarding_one.dart';
import 'package:lifenest/app/feature/Onboarding/screen/Onboarding_three.dart';
import 'package:lifenest/app/feature/Onboarding/screen/Onboarding_two.dart';
import 'package:lifenest/app/feature/auth/screens/CountryPicker.dart';
import 'package:lifenest/app/feature/auth/screens/CurrentMoodPage_0ne.dart';
import 'package:lifenest/app/feature/auth/screens/CurrentMoodPage_three.dart';
import 'package:lifenest/app/feature/auth/screens/CurrentMoodPage_two.dart';
import 'package:lifenest/app/feature/auth/screens/Forgot_Password.dart';
import 'package:lifenest/app/feature/auth/screens/LoginPage.dart';
import 'package:lifenest/app/feature/auth/screens/RegisterPage.dart';
import 'package:lifenest/app/feature/auth/screens/gender.dart';
import 'package:lifenest/app/feature/chatbot/screens/chatbot.dart';
import 'package:lifenest/app/feature/home/screens/ProfileScreen.dart';
import 'package:lifenest/app/feature/home/screens/home.dart';
import 'package:lifenest/app/feature/mind/screens/BreathingScreen.dart';
import 'package:lifenest/app/feature/mind/screens/MindTools.dart';
import 'package:lifenest/app/feature/music/screen/MusicTherapyScreen.dart';
import 'package:lifenest/app/feature/music/screen/PlayingNowScreen.dart';
import 'package:lifenest/app/routes/routes_name.dart';

import '../feature/Onboarding/screen/onboarding_view.dart';
import '../feature/auth/screens/currrentMoodPage_four.dart';

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
      page: () => SelectCountryScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutesName.currentMood,
      page: () => Currentmoodpage0ne(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutesName.currentMood_two,
      page: () => CurrentMoodPageTwo(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutesName.currentMood_three,
      page: () => CurrentmoodpageThree(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutesName.currentMood_foure,
      page: () => CurrrentmoodpageFour(),
      transition: Transition.fadeIn,
    ),
    //home
    GetPage(
      name: RoutesName.home,
      page: () => Home(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: RoutesName.chatbot,
      page: () => Chatbot(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: RoutesName.mindtools,
      page: () => Mindtools(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: RoutesName.Breathing,
      page: () => BreathingScreen(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: RoutesName.profile,
      page: () => ProfileScreen(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: RoutesName.journal,
      page: () => JournalScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: RoutesName.musiclist,
      page: () => MusicTherapyScreen(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: RoutesName.musicplay,
      page: () => PlayingNowScreen(musicId: Get.arguments as int),
      transition: Transition.fadeIn,
    ),
  ];
}
