import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifenest/app/core/binding/app_binding.dart';
import 'package:lifenest/app/routes/routes_name.dart';
import 'package:lifenest/app/routes/routes_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase before using FirebaseAuth
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
              image: AssetImage(
                'assets/image/background/background_image.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: GetMaterialApp(
            title: 'Lifenest',
            debugShowCheckedModeBanner: false,

            initialRoute: RoutesName.register,
            getPages: RoutesPage.pages,
            initialBinding: AppBinding(),

            theme: ThemeData(
              scaffoldBackgroundColor: Colors.transparent,
            ),
          ),
        );
      },
    );
  }
}