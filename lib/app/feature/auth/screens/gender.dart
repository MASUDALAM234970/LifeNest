import 'package:flutter/material.dart';
import 'package:lifenest/app/constant/AppTextStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lifenest/app/routes/routes_name.dart';

class Gender extends StatelessWidget {
  const Gender({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      //  resizeToAvoidBottomInset: true,
      appBar: AppBar(
        // leading: Image.asset(""),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your Gender ?", style: AppTextStyle.mango70022your),
              SizedBox(height: 30.h),

              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 17,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutesName.country);
                    },
                    child: SizedBox(
                      width: 160.w,
                      height: 185.h,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.h,
                          horizontal: 15.w,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x992a2d93), // background color
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: const Color(0xff3C83F6), // blue border
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/image/auth/male.png",
                              height: 100.h,
                            ),

                            SizedBox(height: 15.h),

                            Container(
                              width: 101.w,
                              height: 31.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xff3C83F6),
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: GestureDetector(
                                child: Text(
                                  "Male",
                                  style: AppTextStyle.mango700214mf,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutesName.country);
                    },
                    child: SizedBox(
                      width: 160.w,
                      height: 185.h,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.h,
                          horizontal: 15.w,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x992A2D93), // background color
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: const Color(0xff3C83F6), // blue border
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/image/auth/female.png",
                              height: 100.h,
                            ),

                            SizedBox(height: 15.h),

                            Container(
                              width: 101.w,
                              height: 31.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xff3C83F6),
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Text(
                                "Female",
                                style: AppTextStyle.mango700214mf,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
