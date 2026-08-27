import 'package:flutter/material.dart';
import 'package:lifenest/app/constant/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../routes/routes_name.dart';
import '../../profile/controller/ProfileController.dart';
import '../controller/HomeController.dart';
import 'CustomBottomNavBar.dart';
class Home extends GetView<Homecontroller> {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      appBar: AppBar(
        leading: Obx(() {
          final imageUrl =
              controller.userProfile.value?.profilePictureUrl ?? "";

          if (imageUrl.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: Image.asset(
                  "assets/image/home/profile.png",
                  fit: BoxFit.cover,
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/image/home/profile.png",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          );
        }),

        backgroundColor: Colors.transparent,
        elevation: 0,

        title: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good morning",
                style: AppTextStyle.mango60026home,
              ),
              Text(
                "${controller.userProfile.value?.name ?? "Loading..."}!",
                style: AppTextStyle.mango60016name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        }),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Image.asset(
              "assets/image/home/notification.png",
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 19, right: 19),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Text(
                "Fuel your day with powerful thoughts",
                style: AppTextStyle.mango40016selection,
              ),
              SizedBox(height: 30.h),

              /// Card
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: const Color(0x992a2d93),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: const Color(0x1a9c3aff), width: 1),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.15),
                      ),
                      child: const Icon(
                        Icons.sentiment_satisfied_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesName.featur);
                        },
                        child: Text(
                          "How are you feeling today?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.h),

              GestureDetector(
                onTap: () {
                  Get.toNamed(RoutesName.mindtools);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Quick Access", style: AppTextStyle.mango70014aui),
                    Text("View all", style: AppTextStyle.mango40012views),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          //      Get.to(() => Feature());
                        },
                        child: Image.asset("assets/image/home/journal.png"),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset("assets/image/home/spiritual.png"),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15.h),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesName.sos);
                        },
                        child: Image.asset("assets/image/home/sos.png"),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesName.chatbot);
                        },
                        child: Image.asset("assets/image/home/ai_coach.png"),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25.h),
              SizedBox(height: 5.h),
              Image.asset("assets/image/home/daily.png"),
            ],
          ),
        ),
      ),

      /// ✅ Bottom Nav (GetX)
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }
}
