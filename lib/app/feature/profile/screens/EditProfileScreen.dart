import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/app_text_style.dart';
import '../../../core/conts/endpoints.dart';
import '../controller/ProfileController.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final ProfileController controller = Get.find<ProfileController>();

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
        title: Text("Edit Profile", style: AppTextStyle.mango70018cur),
        centerTitle: true,
        // centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Obx(() {
              final selectedImage = controller.selectedProfileImage.value;
              final profileImage =
                  controller.userProfile.value?.profilePictureUrl ?? "";
              print(
                "PROFILE IMAGE URL: ${controller.userProfile.value?.profilePictureUrl}",
              );
              return Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 55.r,
                      backgroundColor: Colors.grey.shade200,
                      child: ClipOval(
                        child: selectedImage != null
                            ? Image.file(
                          selectedImage,
                          width: 110.r,
                          height: 110.r,
                          fit: BoxFit.cover,
                        )
                            : profileImage.isNotEmpty
                            ? Image.network(
                          profileImage,
                          key: ValueKey(profileImage),
                          width: 110.r,
                          height: 110.r,
                          fit: BoxFit.cover,
                          errorBuilder: (
                              context,
                              error,
                              stackTrace,
                              ) {
                            return Image.asset(
                              "assets/image/home/profile.png",
                              width: 110.r,
                              height: 110.r,
                              fit: BoxFit.cover,
                            );
                          },
                        )
                            : Image.asset(
                          "assets/image/home/profile.png",
                          width: 110.r,
                          height: 110.r,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () async {
                          await controller.pickProfileImage();
                        },
                        child: Container(
                          width: 35.r,
                          height: 35.r,
                          decoration: const BoxDecoration(
                            color: Color(0xff3C83F6),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),

            SizedBox(height: 25.h),

            SizedBox(height: 25.h),



            /// Name
            Text("Name", style: AppTextStyle.mango50012dont),

            SizedBox(height: 6.h),
            TextField(
              controller: controller.nameController,
              style: AppTextStyle.mango50010FAFAFA,
              decoration: InputDecoration(
                hintText: "Enter your name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),

            SizedBox(height: 20.h),

            /// Date of Birth
            Text("Date of Birth", style: AppTextStyle.mango40012email),

            SizedBox(height: 6.h),

            TextField(
              controller: controller.dobController,
              style: AppTextStyle.mango50010FAFAFA,
              decoration: InputDecoration(
                hintText: "YYYY-MM-DD",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),

            SizedBox(height: 20.h),

            //Age
            Text("Age", style: AppTextStyle.mango40012email),

            SizedBox(height: 6.h),

            TextField(
              style: AppTextStyle.mango50010FAFAFA,
              readOnly: true,
              controller: TextEditingController(
                text: controller.userProfile.value?.age.toString() ?? "",
              ),
              decoration: InputDecoration(
                hintText: "Age",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),

            /// Gender
            Text("Gender", style: AppTextStyle.mango40012email),

            SizedBox(height: 6.h),

            Obx(
              () => DropdownButtonFormField<String>(
                value: controller.gender.value.isEmpty
                    ? null
                    : controller.gender.value,

                decoration: InputDecoration(

                  hintText: "Select Gender",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),

                items: const [
                  DropdownMenuItem(value: "male", child: Text("Male")),
                  DropdownMenuItem(value: "female", child: Text("Female")),
                  DropdownMenuItem(value: "other", child: Text("Other")),
                ],

                onChanged: (value) {
                  if (value != null) {
                    controller.gender.value = value;
                  }
                },
              ),
            ),

            SizedBox(height: 20.h),

            /// Occupation
            Text("Occupation", style: AppTextStyle.mango40012email),

            SizedBox(height: 6.h),

            TextField(
              style: AppTextStyle.mango50010FAFAFA,
              controller: controller.occupationController,
              decoration: InputDecoration(
                hintText: "Enter your occupation",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),

            SizedBox(height: 35.h),

            /// Save Button
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.updateProfile,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3C83F6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),

                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          "Save Changes",
                          style: AppTextStyle.mango50014signIn,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
