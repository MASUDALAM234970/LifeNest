import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifenest/app/feature/home/controller/HomeController.dart';

import '../../../constant/AppTextStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'helper.dart';

class Feature extends GetView<Homecontroller> {
  const Feature({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Image.asset("assets/image/arrow/arrow.png"),
        ),

        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Feature", style: AppTextStyle.mango70018cur),
        centerTitle: true,
        // centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            FeatureCard(
              image: "assets/image/feature/feature_01.png",
              title: "Journal",
              subtitle:
              "Record your thoughts, get AI-powered\ninsights, and chat with your coach.",
            ),

            FeatureCard(
              image: "assets/image/feature/feature_01.png",
              title: "Spiritual",
              subtitle:
              "Track your spiritual and wellness goals.\nYou're crushing it!",
            ),

            FeatureCard(
              image: "assets/image/feature/feature_01.png",
              title: "SOS",
              subtitle:
              "Find crisis resources and immediate help.\nIt’s okay to ask.",
            ),
            FeatureCard(
              image: "assets/image/feature/feature_01.png",
              title: "Ai Coach",
              subtitle:
              "Record your thoughts, get AI-powered\ninsights, and chat with your coach.",
            ),
        
            FeatureCard(
              image: "assets/image/feature/feature_01.png",
              title: "Mind Tools",
              subtitle:
              "Quick, interactive tools to help you\nground and recenter.",
            ),
        
            FeatureCard(
              image: "assets/image/feature/feature_01.png",
              title: "Reminder",
              subtitle:
              "Receive a notification for your daily\ncheck-in.",
            ),
        
        
          ],
        ),
      ),
    );
  }
}
