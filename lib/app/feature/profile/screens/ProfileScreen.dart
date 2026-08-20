import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_effects/animated_text_effects.dart';
import '../../../constant/AppTextStyle.dart';
import '../../home/screens/CustomBottomNavBar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Image.asset("assets/image/arrow/arrow.png"),
        ),

        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Profile", style: AppTextStyle.mango70018cur),
        centerTitle: true,
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 10, top: 15),
        child: Column(
          children: [
            Container(
              width: 335,
              height: 133,
              decoration: BoxDecoration(
                color: const Color(0x992A2D93),
                //  border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/image/home/profile.png",
                        width: 70,
                        height: 70,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "      MD MASUD ALAM ",
                        style: AppTextStyle.mango50012dont,
                      ),
                    ],
                  ),

                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Edit Profile",
                      style: AppTextStyle.mango50012dont,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: 335,
              height: 99,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                //  border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  AnimatedText(
                    effects: const [WaveColorEffect()],
                    "Your Mood Journey for Today",
                    style: AppTextStyle.mango80017FAFAFA,
                  ),
                  SizedBox(height: 10),
                  AnimatedText(
                    "Happy",
                    effects: const [WaveColorEffect()],
                    style: AppTextStyle.mango70017FAFAFA,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 335,
              height: 35,
              decoration: BoxDecoration(
                color: const Color(0x992A2D93),
                //  border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "Alisa234970@gmail.com",
                      style: AppTextStyle.mango50010FAFAFA,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 335,
              height: 35,
              decoration: BoxDecoration(
                color: const Color(0x992A2D93),
                //  border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "Date_of_birth : 2000-05-15",
                      style: AppTextStyle.mango50010FAFAFA,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 335,
              height: 35,
              decoration: BoxDecoration(
                color: const Color(0x992A2D93),
                //  border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      " Age : 25",
                      style: AppTextStyle.mango50010FAFAFA,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      " Gender : Male",
                      style: AppTextStyle.mango50010FAFAFA,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 335,
              height: 35,
              decoration: BoxDecoration(
                color: const Color(0x992A2D93),
                //  border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "Last_login : 2026-08-20",
                      style: AppTextStyle.mango50010FAFAFA,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: 335,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF2A2D93),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 20,
                      ),

                      const SizedBox(width: 12),

                      const Expanded(
                        child: Text(
                          'Privacy & Legal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      const Icon(
                        Icons.chevron_right,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: 335,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF2A2D93),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        color: Colors.redAccent,
                        size: 20,
                      ),

                      const SizedBox(width: 12),

                      const Expanded(
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      const Icon(
                        Icons.chevron_right,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      /// ✅ Bottom Nav (GetX)
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
    );
  }
}
