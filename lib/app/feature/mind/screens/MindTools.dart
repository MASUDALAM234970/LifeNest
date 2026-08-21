import 'package:flutter/material.dart';
import 'package:lifenest/app/feature/home/controller/HomeController.dart';
import 'package:lifenest/app/feature/mind/screens/GroundingScree.dart';
import '../../../constant/app_text_style.dart';
import 'package:get/get.dart';
import '../../../routes/routes_name.dart';
import '../../home/screens/helper.dart';
import 'BreathingScreen.dart';
class Mindtools extends GetView<Homecontroller> {
  const Mindtools({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.offAllNamed(RoutesName.home),
          icon: Image.asset("assets/image/arrow/arrow.png"),
        ),

        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Mind Tools", style: AppTextStyle.mango70018cur),
        centerTitle: true,
        // centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            FeatureCard(
              image: "assets/image/mindtools/mind_1.png",
              title: "Breathing Timer",
              subtitle: "Sync your breath with a calming \nanimation.",
              onTap: () {
                Get.to(() => const BreathingScreen());
              },
            ),

            FeatureCard(
              image: "assets/image/mindtools/mind_2.png",
              title: "5-4-3-2-1 Grounding",
              subtitle: "Sync your breath with a calming \nanimation.",
              onTap: () {
                Get.to(() => const GroundingScreen());
              },
            ),

            FeatureCard(
              image: "assets/image/mindtools/mind_3.png",
              title: "Mirror Talk",
              subtitle: "Practice self-compassion with a guided\nscript.",
              onTap: () {
                Get.toNamed(RoutesName.mirrortalk);
              },
            ),
            FeatureCard(
              image: "assets/image/mindtools/mind_4.png",
              title: "Music Therapy",
              subtitle: "Practice self-compassion with a guided\nscript.",
              onTap: () {
                Get.toNamed(RoutesName.musictherapy);
              },
            ),
          ],
        ),
      ),
    );
  }
}
