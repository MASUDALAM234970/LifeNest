import 'package:flutter/material.dart';
import 'package:lifenest/app/constant/comon/button.dart';
import 'package:lifenest/app/feature/auth/controller/CurrentMoodController.dart';
import 'package:lifenest/app/routes/routes_name.dart';

import '../../../constant/AppTextStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Currentmoodpage0ne extends GetView<CurrentMoodController> {
  const Currentmoodpage0ne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // 🔥 important

      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Image.asset("assets/image/arrow/arrow.png"),
        ),

        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Current Mood", style: AppTextStyle.mango70018cur),
        centerTitle: true,
        // centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + kToolbarHeight,
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30.h),

           // Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: LinearProgressIndicator(
                    value: controller.progress,
                    minHeight: 6,
                    backgroundColor: Color(0xFFFFFFFF),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF3B0EAF),
                    ),
                  ),
                ),
              ),


              SizedBox(height: 40.h),
              const Spacer(),

              /// Bottom Sheet Area
              SizedBox(height: 20.h),
              SizedBox(
                width: 374.w,
                height: 560,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0x992A2D93),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  padding: EdgeInsets.fromLTRB(24, 36, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Question
                      Column(

                        children: [
                          Text(
                            'How are you feeling today?',
                            style: AppTextStyle.mango60026home,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Select emotions and thoughts that best describe your current state',
                            style: AppTextStyle.mango40016_selection,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),

                       SizedBox(height: 50.h),

                      /// Mood Grid
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(controller.moods.length, (
                            index,
                          ) {
                            final mood = controller.moods[index];
                            final isSelected = controller.isMoodSelected(index);

                            return GestureDetector(
                              onTap: () => controller.selectMood(index),
                              child: Column(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isSelected
                                            ? Colors.lightBlueAccent
                                            : Colors.white.withOpacity(0.30),
                                        width: isSelected ? 2.5 : 1.5,
                                      ),
                                      color: isSelected
                                          ? Colors.lightBlueAccent.withOpacity(
                                              0.15,
                                            )
                                          : Colors.transparent,
                                    ),
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      mood['image'],
                                      width: 32,
                                      height: 32,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    mood['label'],
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.lightBlueAccent
                                          : Colors.white.withOpacity(0.55),
                                      fontSize: 14,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        );
                      }),

                      const Spacer(),

                      /// Next Button
                      AppButton(
                        text: "Next",
                        width: 336.w,
                        height: 50.h,
                        onPressed: () {
                          Get.toNamed(RoutesName.currentMood_two);
                        },
                        textStyle: AppTextStyle.mango50014signIn,
                      ),
                      SizedBox(height: 28),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
