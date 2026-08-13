import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifenest/app/feature/home/controller/HomeController.dart';
import 'package:lifenest/app/routes/routes_name.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../constant/AppTextStyle.dart';
import 'helper.dart';

class Feature extends GetView<Homecontroller> {
  const Feature({super.key});

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
              onTap: () {
                Fluttertoast.showToast(
                  msg: "This feature is coming soon",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
              },
            ),

            FeatureCard(
              image: "assets/image/feature/feature_02.png",
              title: "Spiritual",
              subtitle:
                  "Track your spiritual and wellness goals.\nYou're crushing it!",
              onTap: () {
                Fluttertoast.showToast(
                  msg: "This feature is coming soon",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                );
              },
            ),

            FeatureCard(
              image: "assets/image/feature/feature_03.png",
              title: "SOS",
              subtitle:
                  "Find crisis resources and immediate help.\nIt’s okay to ask.",
              onTap: () {
                Get.toNamed(RoutesName.sos);
              },
            ),
            FeatureCard(
              image: "assets/image/feature/feature_04.png",
              title: "Ai Coach",
              subtitle:
                  "Record your thoughts, get AI-powered\ninsights, and chat with your coach.",
              onTap: () {
                Get.toNamed(RoutesName.chatbot);
              },
            ),

            FeatureCard(
              image: "assets/image/feature/feature_05.png",
              title: "Mind Tools",
              subtitle:
                  "Quick, interactive tools to help you\nground and recenter.",
              onTap: () => Get.toNamed(RoutesName.mindtools),
            ),

            FeatureCard(
              image: "assets/image/feature/feature_06.png",
              title: "Reminder",
              subtitle: "Receive a notification for your daily\ncheck-in.",
              onTap: () {
                Fluttertoast.showToast(
                  msg: "This feature is coming soon",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
