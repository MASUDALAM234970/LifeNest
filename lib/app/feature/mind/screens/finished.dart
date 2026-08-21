import 'package:flutter/material.dart';
import 'package:lifenest/app/feature/mind/screens/GroundingScree.dart';

import '../../../constant/app_text_style.dart';
import 'package:get/get.dart';

import 'MindTools.dart';

class Finished extends StatelessWidget {
  const Finished({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "5-4-3-2-1 Grounding",
          style: AppTextStyle.mango70016sos,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          children: [
            SizedBox(height: 140),

            SizedBox(
              width: 325,
              height: 339,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff2A2D93),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/image/grounding/g_6.png",
                      width: 257,
                      height: 150,
                    ),
                    SizedBox(height: 50),
                    Text("Well done!", style: AppTextStyle.mango70018cur),
                  ],
                ),
              ),
            ),

            Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: OutlinedButton(
                        onPressed: () => Get.to(() => const GroundingScreen()),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xff3C83F6)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text(
                          "Restart",
                          style: AppTextStyle.mango500143C83F6,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 7),

                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const Mindtools()),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff3C83F6),
                          foregroundColor: const Color(0xffFAFAFA),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Text(
                          "Back",
                          style: AppTextStyle.mango50014FAFAFA,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
