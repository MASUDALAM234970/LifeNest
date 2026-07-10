import 'package:flutter/material.dart';
import 'package:lifenest/app/constant/AppTextStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lifenest/app/feature/home/screens/Feature.dart';

import 'package:lifenest/app/feature/home/screens/sos.dart';

import '../../../constant/AppTextStyle.dart';
import '../../../routes/routes_name.dart';
import '../controller/HomeController.dart';

class Home extends GetView<Homecontroller> {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/image/home/profile.png"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good morning", style: AppTextStyle.mango60026home),
            Text("Sohan!", style: AppTextStyle.mango60016name),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Image.asset("assets/image/home/notification.png"),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 19, right: 19),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Text(
                "Fuel your day with powerful thoughts",
                style: AppTextStyle.mango40016_selection,
              ),
              SizedBox(height: 30.h),

              /// Card
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: const Color(0x992a2d93),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: const Color(0x1a9c3aff), width: 1),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.15),
                      ),
                      child: const Icon(
                        Icons.sentiment_satisfied_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        "How are you feeling today?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quick Access", style: AppTextStyle.mango70014aui),
                  Text("View all", style: AppTextStyle.mango40012views),
                ],
              ),

              SizedBox(height: 20.h),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => Feature());
                        },
                        child: Image.asset("assets/image/home/journal.png"),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset("assets/image/home/spiritual.png"),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15.h),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => Sos());
                        },
                        child: Image.asset("assets/image/home/sos.png"),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset("assets/image/home/ai_coach.png"),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25.h),
              SizedBox(height: 5.h),
              Image.asset("assets/image/home/daily.png"),
            ],
          ),
        ),
      ),

      /// ✅ Bottom Nav (GetX)
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
        child: Container(
          height: 65.h,
          decoration: BoxDecoration(
            color: const Color(0xFF2B0063),
            borderRadius: BorderRadius.circular(40.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Obx(() {
            final current = controller.currentIndex.value;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(Icons.home, 0, current),
                _navItem(Icons.menu_book_outlined, 1, current),
                _navItem(Icons.grid_view_outlined, 2, current),
                _navItem(Icons.person_outline, 3, current),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, int index, int current) {
    final isActive = current == index;

    return GestureDetector(
      onTap: () => _onNavTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(10.w),
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
              )
            : null,
        child: Icon(
          icon,
          color: isActive ? Colors.black : Colors.white,
          size: 24.sp,
        ),
      ),
    );
  }

  void _onNavTap(int index) {
    controller.changeIndex(index);

    switch (index) {
      case 0:
        Get.offAllNamed(RoutesName.home);
        break;
      case 1:
        //Get.offAllNamed(RoutesName.book);
        break;
      case 2:
        Get.offAllNamed(RoutesName.chatbot);
        break;
      case 3:
        Get.offAllNamed(RoutesName.profile);
        break;
    }
  }
}
