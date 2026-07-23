import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifenest/app/feature/auth/controller/LoginPageController.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/AppTextStyle.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String email = Get.arguments ?? "";
    final LoginPageController controller = Get.find<LoginPageController>();

    final defaultPinTheme = PinTheme(
      width: 55,
      height: 60,
      textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:  Text("Verify OTP",style: AppTextStyle.mango80020Daily,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const SizedBox(height: 10),
        
              const Icon(
                Icons.mark_email_read_outlined,
                size: 80,
                color: Colors.blue,
              ),
        
              const SizedBox(height: 10),
        
               Text(
                "Verify Your Email",
                style: AppTextStyle.marko40024wel,
              ),
        
              const SizedBox(height: 10),
        
              Text(
                "Enter the 6-digit code sent to\n$email",
                textAlign: TextAlign.center,
                style: AppTextStyle.mango50012singup,
              ),
        
              const SizedBox(height: 40),
        
              Pinput(
                controller: otpController,
                length: 6,
                defaultPinTheme: defaultPinTheme,
              ),
        
              const SizedBox(height: 40),
            // const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff3C83F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  onPressed: () async {
                    if (otpController.text.length != 6) {
                      Get.snackbar(
                        "Error",
                        "Please enter a valid 6-digit OTP",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }
        
                    await controller.verifyOtp(
                      email: email,
                      otp: otpController.text.trim(),
                    );
                  },
                  child:  Text(
                    "Verify Account",
                    style: AppTextStyle.mango50014signIn,
                  ),
                ),
              ),
        
              const SizedBox(height: 20),
        
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
                    //Get.toNamed(RoutesName.home);
                    controller.sendOtp(email);
                  },
                  child: Text("Resend OTP", style: AppTextStyle.mango50014signIn),
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
