import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/AppTextStyle.dart';
import '../../../constant/AppTexts.dart';
import '../../../routes/routes_name.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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

        // centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 19,
            right: 19,
            top: 16,
            bottom: 16 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              Image.asset("assets/image/auth/juno_86.png"),
              SizedBox(height: 5.h),

              Text(
                Apptexts.Request_password,
                style: AppTextStyle.marko40024wel,
              ),

              SizedBox(height: 4.h),

              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  Apptexts.clicked,
                  style: AppTextStyle.mango50014login,
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 25.h),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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

              SizedBox(height: 42.h),

              SizedBox(
                width: 336.w,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3C83F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    Apptexts.send_Reset,
                    style: AppTextStyle.mango50014signIn,
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              GestureDetector(
                onTap: () => Get.offAllNamed(RoutesName.login),
                child: RichText(
                  text: TextSpan(
                    text: Apptexts.remember_yours,
                    style: AppTextStyle.mango50012dont,
                    children: [
                      TextSpan(
                        text: " Sign In",
                        style: AppTextStyle.mango50012singup,
                      ),
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
