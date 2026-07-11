import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/routes_name.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
      child: Container(
        height: 65.h,
        decoration: BoxDecoration(
          color: const Color(0xFF2B0063),
          borderRadius: BorderRadius.circular(40.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home, 0),
            _navItem(Icons.menu_book_outlined, 1),
            _navItem(Icons.chat_bubble, 2),
            _navItem(Icons.person_outline, 3),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, int index) {
    final isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => _onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(10.w),
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
              )
            : null,
        child: Icon(
          icon,
          size: 24.sp,
          color: isActive ? Colors.black : Colors.white,
        ),
      ),
    );
  }

  void _onTap(int index) {
    switch (index) {
      case 0:
        Get.offAllNamed(RoutesName.home);
        break;

      case 1:
        Get.offAllNamed(RoutesName.journal);
        break;

      case 2:
        Get.offAllNamed(RoutesName.chatbot);
        break;

      case 3:
        Get.offAllNamed(RoutesName.profile);
        break;
    }
  }
}
