import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lifenest/app/constant/app_text_style.dart';

import '../../home/screens/CustomBottomNavBar.dart';
import '../../profile/controller/ProfileController.dart';
import '../controller/ChatbotController.dart';
import '../models/ChatMessageModel.dart';

class Chatbot extends GetView<ChatbotController> {
  const Chatbot({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatbotController(), tag: null);


    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: controller.hasMessages
                    ? _ChatList(controller: controller)
                    : const _WelcomeState(),
              ),
              _ChatInputBar(controller: controller),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }
}

class _WelcomeState extends StatelessWidget {
  const _WelcomeState();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/image/auth/juno_86.png",
            width: 77.5.w,
            height: 100.h,
          ),
          SizedBox(height: 20.h),
          Text(
            "Meet Juno — your private voice journaling companion.",
            textAlign: TextAlign.center,
            style: AppTextStyle.mango80016FAFAFA,
          ),
          SizedBox(height: 8.h),
          Text(
            "Speak your mind. Understand your emotions. Heal with AI.",
            textAlign: TextAlign.center,
            style: AppTextStyle.mango40012feature,
          ),
        ],
      ),
    );
  }
}

class _ChatList extends StatelessWidget {
  final ChatbotController controller;

  const _ChatList({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller.scrollController,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount:
          controller.messages.length + (controller.isBotTyping.value ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == controller.messages.length) {
          return const _TypingBubble();
        }
        final msg = controller.messages[index];
        return _ChatBubble(message: msg);
      },
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final ChatMessageModel message;

  const _ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;

    final bubble = Container(
      constraints: BoxConstraints(maxWidth: 0.7.sw),
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: isUser
            ? Colors.white.withOpacity(0.16)
            : (message.isError
                  ? Colors.red.withOpacity(0.25)
                  : Colors.white.withOpacity(0.14)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.r),
          topRight: Radius.circular(18.r),
          bottomLeft: Radius.circular(isUser ? 18.r : 4.r),
          bottomRight: Radius.circular(isUser ? 4.r : 18.r),
        ),
      ),
      child: Text(
        message.text,
        style: TextStyle(color: Colors.white, fontSize: 14.sp, height: 1.4),
      ),
    );

    final avatar = isUser ? const _UserAvatar() : const _BotAvatar();

    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        mainAxisAlignment: isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: isUser
            ? [Flexible(child: bubble), SizedBox(width: 8.w), avatar]
            : [avatar, SizedBox(width: 8.w), Flexible(child: bubble)],
      ),
    );
  }
}

class _TypingBubble extends StatelessWidget {
  const _TypingBubble();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const _BotAvatar(),
          SizedBox(width: 8.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.14),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.r),
                topRight: Radius.circular(18.r),
                bottomRight: Radius.circular(18.r),
              ),
            ),
            child: const _TypingDots(),
          ),
        ],
      ),
    );
  }
}

class _TypingDots extends StatefulWidget {
  const _TypingDots();

  @override
  State<_TypingDots> createState() => _TypingDotsState();
}

class _TypingDotsState extends State<_TypingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 10,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (i) {
              final t = (_controller.value - (i * 0.2)) % 1.0;
              final scale =
                  0.5 + 0.5 * (1 - (t - 0.5).abs() * 2).clamp(0.0, 1.0);
              return Opacity(
                opacity: 0.4 + 0.6 * scale,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class _BotAvatar extends StatelessWidget {
  const _BotAvatar();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16.r,
      backgroundColor: const Color(0xFF2DD4C8),
      child: Icon(Icons.smart_toy_sharp, size: 16.sp, color: Colors.white),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Obx(() {
      final imageUrl = controller.userProfile.value?.profilePictureUrl ?? "";

      return CircleAvatar(
        radius: 16.r,
        backgroundColor: Colors.white24,
        child: ClipOval(
          child: imageUrl.isNotEmpty
              ? Image.network(
                  imageUrl,
                  width: 32.r,
                  height: 32.r,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Image.asset(
                      "assets/image/profile/user_avatar.png",
                      width: 32.r,
                      height: 32.r,
                      fit: BoxFit.cover,
                    );
                  },
                )
              : Image.asset(
                  "assets/image/profile/user_avatar.png",
                  width: 32.r,
                  height: 32.r,
                  fit: BoxFit.cover,
                ),
        ),
      );
    });
  }
}

class _ChatInputBar extends StatelessWidget {
  final ChatbotController controller;

  const _ChatInputBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0x992a2d93),
          borderRadius: BorderRadius.circular(31.r),
          border: Border.all(color: const Color(0x4d3c83f6)),
        ),
        child: Row(
          children: [
            Obx(
              () => IconButton(
                onPressed: controller.toggleVoiceInput,
                icon: Icon(
                  Icons.mic_rounded,
                  color: controller.isListening.value
                      ? const Color(0xFF60A5FA)
                      : Colors.white70,
                ),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller.inputController,
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => controller.sendMessage(),
                decoration: InputDecoration(
                  hintText: "What are you feeling...",
                  hintStyle: TextStyle(color: Colors.white54, fontSize: 14.sp),
                  border: InputBorder.none,
                ),
              ),
            ),
            Obx(
              () => controller.isSending.value
                  ? Padding(
                      padding: EdgeInsets.all(10.r),
                      child: SizedBox(
                        width: 18.w,
                        height: 18.w,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white70,
                        ),
                      ),
                    )
                  : IconButton(
                      onPressed: controller.sendMessage,
                      icon: Icon(
                        Icons.send_rounded,
                        color: Colors.white70,
                        size: 20.sp,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
