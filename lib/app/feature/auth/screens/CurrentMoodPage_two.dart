import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:lifenest/app/feature/auth/controller/CurrentMoodController.dart';
import '../../../constant/app_text_style.dart';
import '../../../constant/comon/button.dart';
import '../../../routes/routes_name.dart';

class CurrentMoodPageTwo extends GetView<CurrentMoodController> {
  const CurrentMoodPageTwo({super.key});

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
                    value: controller.progress2,
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
              SizedBox(
                width: 374.w,
                height: 560,
                child: Container(
                  //   width: 347.w,
                  decoration: BoxDecoration(
                    color: const Color(0x992A2D93),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  padding: EdgeInsets.fromLTRB(24, 36, 24, 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// Question
                      Column(
                        children: [
                          Text(
                            'How are you feeling today?',
                            style: AppTextStyle.mango60026home,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Select emotions and thoughts that best describe your current state',
                            style: AppTextStyle.mango40016selection,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),

                      //  SizedBox(height: 50.h),

                      /// Mood Grid
                      /// Goals List
                      SizedBox(
                        width: 335.w,
                        height: 278.h,
                        child: Obx(() {
                          final selected = controller.selectedIndex.value;

                          return ListView.separated(
                            shrinkWrap: true, // ⭐ important
                            itemCount: controller.items.length,
                            separatorBuilder: (_, __) => SizedBox(height: 12.h),
                            itemBuilder: (context, index) {
                              final isSelected = selected == index;

                              return SizedBox(
                                width: 335.w,
                                height: 46.h,
                                child: GestureDetector(
                                  onTap: () => controller.selectItem(index),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      border: Border.all(
                                        color: isSelected
                                            ? const Color(0xff3C83F6)
                                            : Colors.white.withOpacity(0.15),
                                        width: 1.4,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.items[index],
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(
                                              0.90,
                                            ),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                        /// right circle indicator (like your screenshot)
                                        Container(
                                          width: 16.w,
                                          height: 16.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: isSelected
                                                  ? const Color(0xff3C83F6)
                                                  : Colors.white.withOpacity(
                                                      0.25,
                                                    ),
                                              width: 1.6,
                                            ),
                                          ),
                                          child: isSelected
                                              ? Center(
                                                  child: Container(
                                                    width: 8.w,
                                                    height: 8.w,
                                                    decoration:
                                                        const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color(
                                                            0xff3C83F6,
                                                          ),
                                                        ),
                                                  ),
                                                )
                                              : const SizedBox.shrink(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),

                      const Spacer(),

                      /// Next Button
                      AppButton(
                        text: "Next",
                        width: 336.w,
                        height: 50.h,
                        onPressed: () {
                          Get.toNamed(RoutesName.currentMood_three);
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
