import 'package:country_picker_pro/country_picker_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/SelectCountryController.dart';



class SelectCountryScreen extends StatelessWidget {
  const SelectCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(SelectCountryController());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFB012A1), Color(0xFF3B1BA8)],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),

                    // Header
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          borderRadius: BorderRadius.circular(999),
                          child: Container(
                            width: 44.w,
                            height: 44.w,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.25),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Select Country",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 44.w),
                      ],
                    ),

                    SizedBox(height: 22.h),

                    // Search box (tap করলে picker খুলবে)
                    InkWell(
                      onTap: () => _openCountryPicker(context, c),
                      borderRadius: BorderRadius.circular(14.r),
                      child: Container(
                        height: 54.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2B1C77).withOpacity(0.55),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 14.w),
                            Icon(Icons.search, color: const Color(0xFF3C83F6), size: 22.sp),
                            SizedBox(width: 12.w),
                            Text(
                              "Find your country",
                              style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 18.h),

                    Text(
                      "All",
                      style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),

                    SizedBox(height: 12.h),

                    // List area look (tap করে picker open)
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(14.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3B1BA8).withOpacity(0.35),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28.r),
                            topRight: Radius.circular(28.r),
                          ),
                        ),
                        child: Column(
                          children: [
                            // Selected tile (same style)
                            Obx(() {
                              return InkWell(
                                onTap: () => _openCountryPicker(context, c),
                                borderRadius: BorderRadius.circular(14.r),
                                child: Container(
                                  height: 66.h,
                                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(14.r),
                                    border: Border.all(
                                      color: const Color(0xFF3C83F6),
                                      width: 2,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(c.selectedFlagEmoji.value, style: TextStyle(fontSize: 26.sp)),
                                      SizedBox(width: 12.w),
                                      Expanded(
                                        child: Text(
                                          c.selectedName.value,
                                          style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Container(
                                        width: 22.w,
                                        height: 22.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: const Color(0xFF3C83F6), width: 2),
                                        ),
                                        child: Center(
                                          child: Container(
                                            width: 10.w,
                                            height: 10.w,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFF3C83F6),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),

                            SizedBox(height: 12.h),

                            // Hint text (optional)
                            Text(
                              "Tap above to choose country",
                              style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Next button fixed
              Positioned(
                left: 18.w,
                right: 18.w,
                bottom: 18.h,
                child: SizedBox(
                  height: 58.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3C83F6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                      elevation: 0,
                    ),
                    onPressed: () {
                      // selected: c.selectedCode.value
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openCountryPicker(BuildContext context, SelectCountryController c) {
    CountrySelector(
      context: context,
      viewType: ViewType.screen, // full screen picker
      appBarTitle: "Select Country",
      countryPreferred: const ['BD', 'US', 'GB'],
      showPhoneCode: false,
      showSearchBox: true,
      useSafeArea: true,

      // Styling (match your theme)
      appBarBackgroundColour: const Color(0xFF2B1C77),
      appBarTextColour: Colors.white,
      backIconColour: Colors.white,
      backgroundColour: const Color(0xFF3B1BA8),
      countryTextColour: Colors.white,
      dividerColour: Colors.white24,

      searchBarBackgroundColor: const Color(0xFF2B1C77),
      searchBarOuterBackgroundColor: const Color(0xFF2B1C77),
      searchBarTextColor: Colors.white,
      searchBarHintColor: Colors.white70,
      searchBarBorderColor: const Color(0xFF3C83F6),
      searchBarBorderWidth: 1.5,
      borderRadius: 18,

      onSelect: (Country country) {
        c.setCountry(
          name: country.name,                 // or country.displayName
          code: country.countryCode,          // ✅ correct
          flagEmoji: country.flagEmoji,       // ✅ correct
        );
      },


    );
  }
}