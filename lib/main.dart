import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifenest/app/core/binding/app_binding.dart';
import 'package:lifenest/app/routes/routes_name.dart';
import 'package:lifenest/app/routes/routes_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
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
        return GetMaterialApp(
          title: "Lifenest",
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.login,
          getPages: RoutesPage.pages,
          initialBinding: AppBinding(),
        );
      },
    );
  }
}
