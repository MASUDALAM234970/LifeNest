import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/AppTextStyle.dart';

class GroundingScreen extends StatelessWidget {
  const GroundingScreen({super.key});

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
            child: Image.asset("assets/image/arrow/arrow.png"),
          ),
        ],
      ),

      body: Column(children: []),
    );
  }
}
