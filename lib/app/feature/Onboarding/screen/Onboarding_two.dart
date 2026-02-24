import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/AppTextStyle.dart';
import '../controller/OnboardingController.dart';

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    return Scaffold(
      extendBodyBehindAppBar: true, // 🔥 important

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        // title: const Text("Home", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + kToolbarHeight,
        ),
        child: Column(
          children: [
            SizedBox(height: 30.h),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset("assets/image/onbording/one_screen (2).png"),
            ),

            const Spacer(),

            /// 🔥 DOT INDICATOR HERE
         //   SizedBox(height: 130.h),

            /// Bottom Container
            SizedBox(
              width: 374.w,
              height: 275.h,
              child: Container(
                //  margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                //  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: Color(0x99111036),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _dot(isActive: false),
                        _dot(isActive: true),
                        _dot(isActive: false),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: Text(
                        "Daily emotional check-ins for a balanced you",
                        style: AppTextStyle.mango80020Daily,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: Text(
                        "See the patterns. Shape your peace.",
                        style: AppTextStyle.mango40014see,
                        //textAlign: TextAlign.center,
                      ),
                    ),

                    SizedBox(height: 15.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 19.w,
                      children: [
                        SizedBox(
                          width: 121.w,
                          height: 43.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r),
                                side: BorderSide(
                                  color: Colors.blue, // তোমার color
                                  width: 1,
                                ),
                              ),
                            ),
                            onPressed: () {
                              controller.skip();
                            },
                            child: Text(
                              "Skip",
                              style: AppTextStyle.inter60016skip,
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 121.w,
                          height: 43.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff3C83F6),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r),
                                side: BorderSide(
                                  color: Colors.blue, // তোমার color
                                  width: 1,
                                ),
                              ),
                            ),
                            onPressed: () {
                              controller.continue_three();
                            },
                            child: Text(
                              "Continue",
                              style: AppTextStyle.inter60014continue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Lifenest helps you manage your mental well-being.",
                      style: TextStyle(color: Colors.white, fontSize: 11.sp),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dot({required bool isActive}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      width: isActive ? 20.w : 6.w,
      height: 6.h,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }
}
