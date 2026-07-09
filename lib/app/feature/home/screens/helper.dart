import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/AppTextStyle.dart';

class FeatureCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onTap;


  const FeatureCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
        child: SizedBox(
          width: 345.w,
          height: 100.h,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0x992A2D93),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image, width: 76.w, height: 100.h, fit: BoxFit.cover),
                // Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(title, style: AppTextStyle.mango70016sos),

                      Text(subtitle, style: AppTextStyle.mango40012feature),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SosCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String phone;
  final VoidCallback onVisit;

  const SosCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.phone,
    required this.onVisit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0x992A2D93),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Image.asset(
              image,
              width: 90,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.mango70014sos,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: AppTextStyle.mango50012sos,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    phone,
                    style: AppTextStyle.mango50014google,
                  ),

                // const Spacer(),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: 117,
                        height: 36,
                        child: ElevatedButton(
                          onPressed: onVisit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE91E8C),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),

                          child: Text(
                            "Visit",
                            style: AppTextStyle.mango50014google,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 16),
        ],
      ),
    );
  }
}