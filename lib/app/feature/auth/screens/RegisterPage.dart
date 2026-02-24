import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifenest/app/routes/routes_name.dart';

import '../../../constant/AppTextStyle.dart';
import '../../../constant/AppTexts.dart';
class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   extendBodyBehindAppBar: true, // 🔥 important

      appBar: AppBar(
        automaticallyImplyLeading: true ,
        backgroundColor: Colors.transparent,
        elevation: 0,

        // centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + kToolbarHeight,
          ),
          child: Center(
            child: Column(
              children: [


                Text(Apptexts.Create_an, style: AppTextStyle.marko40024wel),
                Text(Apptexts.please_sign, style: AppTextStyle.mango50014login),
                SizedBox(height: 30.h),
                Padding(
                  padding: const EdgeInsets.only(left: 19, right: 19),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //--------------------name-------------------
                      Text("   Name", style: AppTextStyle.mango40012email),
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: 336.w,
                        height: 50.h,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Enter Full Name",
                            hintStyle: AppTextStyle.mango40014enter,

                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Color(0xff3C83F6),
                            ),

                            filled: true,
                            fillColor: const Color(0xFF3A1C71),

                            // purple background
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16.h,
                              horizontal: 16.w,
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                color: Color(0xff2A2D93),
                                width: 1.5,
                              ),
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                color: Color(0xff2A2D93),
                                width: 1.5,
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                color: Color(0xff3C83F6),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      //--------------------Email-------------------
                      Text("   Email", style: AppTextStyle.mango40012email),
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: 336.w,
                        height: 50.h,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: Apptexts.enter_email,
                            hintStyle: AppTextStyle.mango40014enter,

                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Color(0xff3C83F6),
                            ),

                            filled: true,
                            fillColor: const Color(0xFF3A1C71),

                            // purple background
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16.h,
                              horizontal: 16.w,
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                color: Color(0xff2A2D93),
                                width: 1.5,
                              ),
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                color: Color(0xff2A2D93),
                                width: 1.5,
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                color: Color(0xff3C83F6),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      //--------------------Date of Birth-------------------
                      Text("   Date of Birth", style: AppTextStyle.mango40012email),
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: 336.w,
                        height: 50.h,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "DD/MM/YY",
                            hintStyle: AppTextStyle.mango40014enter,

                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                "assets/image/auth/cander.png",
                                width: 20,
                                height: 20,
                                color: Color(
                                  0xff3C83F6,
                                ), // যদি color tint দিতে চাও
                              ),
                            ),

                            filled: true,
                            fillColor: const Color(0xFF3A1C71),

                            // purple background
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16.h,
                              horizontal: 16.w,
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                color: Color(0xff2A2D93),
                                width: 1.5,
                              ),
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                color: Color(0xff2A2D93),
                                width: 1.5,
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                color: Color(0xff3C83F6),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      //--------------------Date of Birth-------------------
                      Text("Password", style: AppTextStyle.mango40012email),
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: 336.w,
                        height: 50.h,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: Apptexts.enter_password,
                            hintStyle: AppTextStyle.mango40014enter,

                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                "assets/image/auth/fingureprint.png",
                                width: 20,
                                height: 20,
                                color: Color(
                                  0xff3C83F6,
                                ), // যদি color tint দিতে চাও
                              ),
                            ),

                            suffixIcon: const Icon(
                              Icons.visibility_off_outlined,
                              color: Color(0xff3C83F6),
                            ),

                            filled: true,
                            fillColor: const Color(0xFF3A1C71),

                            // purple background
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16.h,
                              horizontal: 16.w,
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                color: Color(0xff2A2D93),
                                width: 1.5,
                              ),
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                color: Color(0xff2A2D93),
                                width: 1.5,
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                color: Color(0xff3C83F6),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //--------------------Date of Birth-------------------

                      SizedBox(height: 20.h),
                      Text("   Confirm Password", style: AppTextStyle.mango40012email),
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: 336.w,
                        height: 50.h,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Confirm Your Password",
                            hintStyle: AppTextStyle.mango40014enter,

                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Color(0xff3C83F6),
                            ),

                            filled: true,
                            fillColor: const Color(0xFF3A1C71),

                            // purple background
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16.h,
                              horizontal: 16.w,
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                color: Color(0xff2A2D93),
                                width: 1.5,
                              ),
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                color: Color(0xff2A2D93),
                                width: 1.5,
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                color: Color(0xff3C83F6),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],



                  ),
                ),
                SizedBox(height: 12.h),

                SizedBox(height: 30.h),
                SizedBox(
                  width: 336.w,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff3C83F6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(RoutesName.gender);
                    },
                    child: Text("Sign UP", style: AppTextStyle.mango50014signIn),
                  ),
                ),
                SizedBox(height: 38.h),
                Padding(
                  padding: const EdgeInsets.only(left: 19, right: 19),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(color: Colors.white, thickness: 1),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          "OR",
                          style: TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                      ),

                      const Expanded(
                        child: Divider(color: Colors.white, thickness: 1),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 19.h),
                Padding(
                  padding: const EdgeInsets.only(left: 19, right: 19),
                  child: Row(
                    children: [
                      Expanded(
                        child: socialButton(
                          text: "Google",
                          iconPath: "assets/image/auth/google.png",
                          onTap: () {},
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: socialButton(
                          text: "Apple",
                          iconPath: "assets/image/auth/apple.png",
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutesName.login);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: AppTextStyle.mango50012dont,
                      children: [
                        TextSpan(
                          text: "Sign In",
                          style: AppTextStyle.mango50012singup,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget socialButton({
    required String text,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6.r),
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: const Color(0xff3C83F6), width: 1.5),
          gradient: const LinearGradient(
            colors: [Color(0x332C2CFF), Color(0x332C2CFF)],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 20.w, height: 20.h),
            SizedBox(width: 10.w),
            Text(text, style: AppTextStyle.mango50014google),
          ],
        ),
      ),
    );
  }
}
