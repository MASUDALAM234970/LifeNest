import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifenest/app/core/binding/app_binding.dart';
import 'package:lifenest/app/routes/routes_name.dart';
import 'package:lifenest/app/routes/routes_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/background/background_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: GetMaterialApp(
            title: "Lifenest",
            debugShowCheckedModeBanner: false,
              initialRoute: RoutesName.onboarding,
            getPages: RoutesPage.pages,
            initialBinding: AppBinding(),

            // ✅ this makes all Scaffold background transparent
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.transparent,
            ),
          ),
        );
      },
    );
  }
}