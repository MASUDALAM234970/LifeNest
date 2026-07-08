import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/AppTextStyle.dart';

class FeatureCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const FeatureCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
        top: 10,
      ),
      child: SizedBox(
        width: 345.w,
        height: 100.h,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0x992A2D93),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 76.w,
                height: 100.h,
                fit: BoxFit.cover
              ),
             // Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: AppTextStyle.mango70018cur,
                    ),

                    Text(
                      subtitle,
                      style: AppTextStyle.mango40012feature,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}