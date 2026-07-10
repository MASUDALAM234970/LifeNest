import 'package:flutter/material.dart';
import 'package:lifenest/app/feature/mind/screens/finished.dart';

import '../../../constant/AppTextStyle.dart';
import 'helpers.dart';
import 'package:get/get.dart';

class GroundingScreen extends StatefulWidget {
  const GroundingScreen({super.key});

  @override
  State<GroundingScreen> createState() => _GroundingScreenState();
}

class _GroundingScreenState extends State<GroundingScreen> {
  final PageController _pageController = PageController();

  int currentPage = 0;

  final List<Widget> pages = const [Page1(), Page2(), Page3(), Page4()];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Last page
       Get.to(()=>Finished());

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: Image.asset("assets/image/arrow/arrow.png"),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("5-4-3-2-1 Grounding", style: AppTextStyle.mango70016sos),
        centerTitle: true,
        // centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Image.asset("assets/image/arrow/cross.png"),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: pages,
              ),
            ),

            SizedBox(
              width: 336,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff3C83F6),
                  foregroundColor: Color(0xffFAFAFA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: nextPage,
                child: Text("Next", style: AppTextStyle.mango50014signIn),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
