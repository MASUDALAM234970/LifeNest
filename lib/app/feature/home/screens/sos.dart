import 'package:flutter/material.dart';
import '../../../constant/app_text_style.dart';
import 'helper.dart';
import 'package:get/get.dart';

class Sos extends StatelessWidget {
  const Sos({super.key});

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
        title: Text("SOS", style: AppTextStyle.mango70018cur),
        centerTitle: true,
        // centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(" Crisis Hotlines", style: AppTextStyle.mango70014sos),
                  SizedBox(height: 18),
                  SosCard(
                    image: "assets/image/sos/sos_call.png",
                    title: "The Trevor Project",
                    subtitle: "Support for  young people.",
                    phone: "+88017**91**64",
                    onVisit: () {},
                  ),

                  const SizedBox(height: 10),
                  SosCard(
                    image: "assets/image/sos/sos_message.png",
                    title: "988 Suicide & Crisis Lifeline",
                    subtitle: "988 Suicide & Crisis Lifeline",
                    phone: "999",
                    onVisit: () {},
                  ),
                  const SizedBox(height: 10),
                  SosCard(
                    image: "assets/image/sos/sos_message.png",
                    title: "988 Suicide & Crisis Lifeline",
                    subtitle: "988 Suicide & Crisis Lifeline",
                    phone: "999",
                    onVisit: () {},
                  ),
                  const SizedBox(height: 20),
                  Image.asset("assets/image/sos/sos_botton.png"),
                  const SizedBox(height: 28),
                  Image.asset("assets/image/sos/sos_botton_2.png"),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
