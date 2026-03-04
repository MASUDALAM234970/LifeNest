import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lifenest/app/feature/auth/controller/CurrentMoodController.dart';
import 'package:lifenest/app/routes/routes_name.dart';

import '../../../constant/AppTextStyle.dart';
import '../../../constant/comon/button.dart';

class CurrentmoodpageThree extends GetView<CurrentMoodController> {
  const CurrentmoodpageThree({super.key});

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

              /// Progress Bar


              // Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: LinearProgressIndicator(
                    value: controller.progress3,
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
                            'How many hours do you usually sleep?',
                            style: AppTextStyle.mango60026home,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Select sleep hours.',
                            style: AppTextStyle.mango40016_selection,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),

                      SizedBox(height: 38.h),

                      /// Mood Grid
                      Expanded(
                        child: Center(
                          child: SizedBox(
                            height: 180.h,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Highlight band
                                Container(
                                  height: 60,
                                  width: 160,
                                  decoration: BoxDecoration(
                                 //   color: Colors.white.withOpacity(0.07),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),

                                // Scroll picker
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 90,
                                      child: ListWheelScrollView.useDelegate(
                                        controller: controller.scrollController,
                                        itemExtent: 60,
                                        perspective: 0.003,
                                        diameterRatio: 2.5,
                                        physics:
                                            const FixedExtentScrollPhysics(),
                                        onSelectedItemChanged:
                                            controller.onHourChanged,
                                        childDelegate:
                                            ListWheelChildBuilderDelegate(
                                              childCount:
                                                  controller.hours.length,
                                              builder: (context, index) {
                                                final hour =
                                                    controller.hours[index];

                                                return Obx(() {
                                                  final isSelected =
                                                      hour ==
                                                      controller
                                                          .selectedHour
                                                          .value;

                                                  return Center(
                                                    child: Text(
                                                      hour.toString().padLeft(
                                                        2,
                                                        '0',
                                                      ),
                                                      style: TextStyle(
                                                        color: const Color(
                                                          0xFF4DB6FF,
                                                        ),
                                                        fontSize: isSelected
                                                            ? 46
                                                            : 30,
                                                        fontWeight: isSelected
                                                            ? FontWeight.w700
                                                            : FontWeight.w500,
                                                        height: 1,
                                                      ),
                                                    ),
                                                  );
                                                });
                                              },
                                            ),
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'hr',
                                      style: TextStyle(
                                        color: Color(0xff3C83F6),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      /// Next Button
                      AppButton(
                        text: "Next",
                        width: 336.w,
                        height: 50.h,
                        onPressed: () {
                          Get.toNamed(RoutesName.currentMood_foure);
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
