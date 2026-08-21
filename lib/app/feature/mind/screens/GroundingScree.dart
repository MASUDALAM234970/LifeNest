import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_text_style.dart';
import '../../../routes/routes_name.dart';
import 'helpers.dart';

class GroundingScreen extends StatefulWidget {
  const GroundingScreen({super.key});

  @override
  State<GroundingScreen> createState() => _GroundingScreenState();
}

class _GroundingScreenState extends State<GroundingScreen> {
  final PageController _pageController = PageController();

  int currentPage = 0;

  Timer? _timer;
  int remainingSeconds = 30;
  bool canNext = false;

  final List<Widget> pages = const [Page1(), Page2(), Page3(), Page4()];

  @override
  void initState() {
    super.initState();

    // Screen open হলেই timer start
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    remainingSeconds = 30;
    canNext = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      }

      if (remainingSeconds == 0) {
        timer.cancel();

        setState(() {
          canNext = true;
        });
      }
    });
  }

  void nextPage() {
    if (!canNext) return;

    if (currentPage < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

      _startTimer();
    } else {
      _timer?.cancel();

      Get.offAllNamed(RoutesName.finish);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("5-4-3-2-1 Grounding", style: AppTextStyle.mango70016sos),
        centerTitle: true,
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
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff3C83F6),
                  disabledBackgroundColor: const Color(0xffc53636),
                  foregroundColor: const Color(0xffFAFAFA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),

                onPressed: canNext ? nextPage : null,

                child: Text(
                  canNext ? "Next" : "$remainingSeconds",
                  style: AppTextStyle.mango50014signIn,
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
