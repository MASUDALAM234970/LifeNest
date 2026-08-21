import 'package:flutter/material.dart';

import '../../../constant/app_text_style.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 140),
        SizedBox(
          width: 325,
          height: 339,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff2A2D93),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/grounding/g_1.png",
                  width: 257,
                  height: 150,
                ),
                Text(
                  "Name 5 things you can see\n           around you.",
                  style: AppTextStyle.mango70018cur,
                ),
              ],
            ),
          ),
        ),

        Spacer(),
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 140),
        SizedBox(
          width: 325,
          height: 339,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff2A2D93),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/grounding/g_2.png",
                  width: 257,
                  height: 150,
                ),
                Text(
                  "Notice 4 things you can feel.",
                  style: AppTextStyle.mango70018cur,
                ),
              ],
            ),
          ),
        ),

        Spacer(),
      ],
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 140),
        SizedBox(
          width: 325,
          height: 339,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff2A2D93),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/grounding/g_3.png",
                  width: 257,
                  height: 150,
                ),
                Text(
                  "Identify 3 things you can hear.",
                  style: AppTextStyle.mango70018cur,
                ),
              ],
            ),
          ),
        ),

        Spacer(),
      ],
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 140),
        SizedBox(
          width: 325,
          height: 339,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff2A2D93),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/grounding/g_4.png",
                  width: 257,
                  height: 150,
                ),
                Text(
                  "Find 2 things you can smell.",
                  style: AppTextStyle.mango70018cur,
                ),
              ],
            ),
          ),
        ),

        Spacer(),
      ],
    );
  }
}
