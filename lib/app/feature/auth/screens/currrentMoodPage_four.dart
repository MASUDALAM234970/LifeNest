import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifenest/app/feature/auth/controller/CurrentMoodController.dart';

import '../../../constant/AppTextStyle.dart';
import '../../../constant/comon/button.dart';
import '../../../routes/routes_name.dart';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/AppTextStyle.dart';
import '../../../constant/comon/button.dart';
import '../../../routes/routes_name.dart';

class CurrrentmoodpageFour extends StatefulWidget {
  const CurrrentmoodpageFour({super.key});

  @override
  State<CurrrentmoodpageFour> createState() => _CurrrentmoodpageFourState();
}

class _CurrrentmoodpageFourState extends State<CurrrentmoodpageFour> {
  // controllers
  late final FixedExtentScrollController hourCtrl;
  late final FixedExtentScrollController minuteCtrl;
  late final FixedExtentScrollController periodCtrl;

  // data
  final List<int> hours12 = List.generate(12, (i) => i + 1); // 1..12
  final List<int> minutes = List.generate(60, (i) => i); // 00..59
  final List<String> periods = const ["am", "pm"];

  // selected values
  int selectedHour = 7;
  int selectedMinute = 20;
  String selectedPeriod = "am";

  @override
  void initState() {
    super.initState();
    hourCtrl = FixedExtentScrollController(initialItem: hours12.indexOf(7));
    minuteCtrl = FixedExtentScrollController(initialItem: 20);
    periodCtrl = FixedExtentScrollController(initialItem: 0);
  }

  @override
  void dispose() {
    hourCtrl.dispose();
    minuteCtrl.dispose();
    periodCtrl.dispose();
    super.dispose();
  }

  String get formattedTime =>
      "${selectedHour.toString().padLeft(2, '0')} : "
          "${selectedMinute.toString().padLeft(2, '0')} "
          "$selectedPeriod";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Image.asset("assets/image/arrow/arrow.png"),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Reminders", style: AppTextStyle.mango70018cur),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + kToolbarHeight,
        ),
        child: Column(
          children: [
            SizedBox(height: 30.h),

            /// Progress (4/4)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: LinearProgressIndicator(
                  value: 1.0, // last step
                  minHeight: 6,
                  backgroundColor: const Color(0xFFFFFFFF),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFF3B0EAF),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40.h),
            const Spacer(),

            /// Bottom Card
            Container(
              width: 374.w,
              height: 560.h,
              decoration: BoxDecoration(
                color: const Color(0x992A2D93),
                borderRadius: BorderRadius.circular(25.r),
              ),
              padding: EdgeInsets.fromLTRB(24.w, 36.h, 24.w, 24.h),
              child: Column(
                children: [
                  Text(
                    'Preferred time of day for reminders?',
                    style: AppTextStyle.mango60026home,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Choose preferred time',
                    style: AppTextStyle.mango40016_selection,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 50.h),

                  /// Time Picker
                  Center(
                    child: SizedBox(
                      height: 180.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 60.h,
                            width: 260.w,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.07),
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                          ),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Hour
                              SizedBox(
                                width: 70.w,
                                child: ListWheelScrollView.useDelegate(
                                  controller: hourCtrl,
                                  itemExtent: 60.h,
                                  perspective: 0.003,
                                  diameterRatio: 2.5,
                                  physics: const FixedExtentScrollPhysics(),
                                  onSelectedItemChanged: (i) {
                                    setState(() => selectedHour = hours12[i]);
                                  },
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: hours12.length,
                                    builder: (context, index) {
                                      final hour = hours12[index];
                                      final isSelected = hour == selectedHour;
                                      return Center(
                                        child: Text(
                                          hour.toString().padLeft(2, '0'),
                                          style: TextStyle(
                                            color: const Color(0xFF4DB6FF),
                                            fontSize:
                                            isSelected ? 46.sp : 30.sp,
                                            fontWeight: isSelected
                                                ? FontWeight.w700
                                                : FontWeight.w500,
                                            height: 1,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),

                              SizedBox(width: 10.w),

                              // Minute
                              SizedBox(
                                width: 70.w,
                                child: ListWheelScrollView.useDelegate(
                                  controller: minuteCtrl,
                                  itemExtent: 60.h,
                                  perspective: 0.003,
                                  diameterRatio: 2.5,
                                  physics: const FixedExtentScrollPhysics(),
                                  onSelectedItemChanged: (i) {
                                    setState(() => selectedMinute = minutes[i]);
                                  },
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: minutes.length,
                                    builder: (context, index) {
                                      final m = minutes[index];
                                      final isSelected = m == selectedMinute;
                                      return Center(
                                        child: Text(
                                          m.toString().padLeft(2, '0'),
                                          style: TextStyle(
                                            color: const Color(0xFF4DB6FF),
                                            fontSize:
                                            isSelected ? 46.sp : 30.sp,
                                            fontWeight: isSelected
                                                ? FontWeight.w700
                                                : FontWeight.w500,
                                            height: 1,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),

                              SizedBox(width: 10.w),

                              // am/pm
                              SizedBox(
                                width: 50.w,
                                child: ListWheelScrollView.useDelegate(
                                  controller: periodCtrl,
                                  itemExtent: 50.h,
                                  perspective: 0.003,
                                  diameterRatio: 2.5,
                                  physics: const FixedExtentScrollPhysics(),
                                  onSelectedItemChanged: (i) {
                                    setState(() => selectedPeriod = periods[i]);
                                  },
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: periods.length,
                                    builder: (context, index) {
                                      final p = periods[index];
                                      final isSelected = p == selectedPeriod;
                                      return Center(
                                        child: Text(
                                          p,
                                          style: TextStyle(
                                            color: const Color(0xFF4DB6FF),
                                            fontSize:
                                            isSelected ? 30.sp : 22.sp,
                                            fontWeight: isSelected
                                                ? FontWeight.w700
                                                : FontWeight.w500,
                                            height: 1,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),

                  /// Next Button
                  AppButton(
                    text: "Next",
                    width: 336.w,
                    height: 50.h,
                    onPressed: () {
                      // selected time: formattedTime
                      // print(formattedTime);
                      Get.toNamed(RoutesName.home);
                    },
                    textStyle: AppTextStyle.mango50014signIn,
                  ),

                  SizedBox(height: 28.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}