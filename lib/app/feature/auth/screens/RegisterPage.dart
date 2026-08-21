import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifenest/app/feature/auth/controller/LoginPageController.dart';
import 'package:lifenest/app/routes/routes_name.dart';

import '../../../constant/app_text_style.dart';
import '../../../constant/app_texts.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginPageController controller = LoginPageController();

    return Scaffold(
      //   extendBodyBehindAppBar: true, // 🔥 important
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        //   elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(Apptexts.createan, style: AppTextStyle.marko40024wel),
              Text(Apptexts.pleasesign, style: AppTextStyle.mango50014login),
              SizedBox(height: 5.h),
              Padding(
                padding: const EdgeInsets.only(left: 19, right: 19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //--------------------name-------------------
                    Text("Name", style: AppTextStyle.mango40012email),
                    SizedBox(height: 5.h),
                    SizedBox(
                      width: 336.w,
                      height: 50.h,
                      child: TextFormField(
                        controller: controller.nameController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter Full Name",
                          hintStyle: AppTextStyle.mango40014enter,

                          prefixIcon: const Icon(
                            Icons.person,
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
                    SizedBox(height: 12.h),

                    //--------------------Email-------------------
                    Text("Email", style: AppTextStyle.mango40012email),
                    SizedBox(height: 5.h),
                    SizedBox(
                      width: 336.w,
                      height: 50.h,
                      child: TextFormField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        decoration: InputDecoration(
                          hintText: Apptexts.enteremail,
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
                            horizontal: 10.w,
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
                    SizedBox(height: 12.h),

                    //--------------------Date of Birth-------------------
                    Text("Date of Birth", style: AppTextStyle.mango40012email),
                    SizedBox(height: 5.h),
                    SizedBox(
                      width: 336.w,
                      height: 50.h,
                      child: TextFormField(
                        controller: controller.dateOfBirthController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        decoration: InputDecoration(
                          hintText: "YYYY-MM-DD",
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
                    SizedBox(height: 12.h),

                    //--------------------Date of Birth-------------------
                    Text("Password", style: AppTextStyle.mango40012email),
                    SizedBox(height: 5.h),
                    Obx(
                          () => SizedBox(
                        width: 336.w,
                        height: 50.h,
                        child: TextFormField(
                          controller: controller.passwordController,

                          obscureText: controller.isPasswordHidden.value,

                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),

                          decoration: InputDecoration(
                            hintText: Apptexts.enterpassword,
                            hintStyle: AppTextStyle.mango40014enter,

                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                "assets/image/auth/fingureprint.png",
                                width: 20,
                                height: 20,
                                color: const Color(0xff3C83F6),
                              ),
                            ),

                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.isPasswordHidden.toggle();
                              },
                              icon: Icon(
                                controller.isPasswordHidden.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: const Color(0xff3C83F6),
                              ),
                            ),

                            filled: true,
                            fillColor: const Color(0xFF3A1C71),

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
                    ),
                    //--------------------Date of Birth-------------------
                    SizedBox(height: 12.h),
                    Text(
                      "Confirm Password",
                      style: AppTextStyle.mango40012email,
                    ),
                    SizedBox(height: 5.h),
                    Obx(
                          () => SizedBox(
                        width: 336.w,
                        height: 50.h,
                        child: TextFormField(
                          controller: controller.confirmPasswordController,

                          obscureText: controller.isConfirmPasswordHidden.value,

                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),

                          decoration: InputDecoration(
                            hintText: "Confirm Your Password",
                            hintStyle: AppTextStyle.mango40014enter,

                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                "assets/image/auth/fingureprint.png",
                                width: 20,
                                height: 20,
                                color: const Color(0xff3C83F6),
                              ),
                            ),

                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.isConfirmPasswordHidden.toggle();
                              },
                              icon: Icon(
                                controller.isConfirmPasswordHidden.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: const Color(0xff3C83F6),
                              ),
                            ),

                            filled: true,
                            fillColor: const Color(0xFF3A1C71),

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
                    )
                  ],
                ),
              ),

              SizedBox(height: 15.h),
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
                  // onPressed: (){
                  //    Get.toNamed(RoutesName.otp);
                  // },
                  onPressed: controller.register,
                  child: Text("Sign UP", style: AppTextStyle.mango50014signIn),
                ),
              ),

              SizedBox(height: 15.h),
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
              SizedBox(height: 15.h),
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
