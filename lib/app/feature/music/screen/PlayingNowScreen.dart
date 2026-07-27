import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/PlayingNowController.dart';


class PlayingNowScreen extends StatelessWidget {
  final int musicId;

  const PlayingNowScreen({super.key, required this.musicId});

  @override
  Widget build(BuildContext context) {
    final controller = PlayingNowController.instance;

    // Kick off load once, right after the first frame.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.currentMusic.value?.id != musicId) {
        controller.loadAndPlay(musicId);
      }
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFB3175E), Color(0xFF3B1E8C)],
          ),
        ),
        child: SafeArea(
          child: Obx(() {
            final music = controller.currentMusic.value;

            if (controller.isLoading.value && music == null) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            if (music == null) {
              return Center(
                child: Text('Track not found', style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
              );
            }

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  _buildHeader(),
                  SizedBox(height: 24.h),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.network(
                        music.banner,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(color: Colors.white10),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              music.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              music.artist,
                              style: TextStyle(color: Colors.white60, fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.notes, color: Colors.white70),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          controller.isFavorite.value ? Icons.favorite : Icons.favorite_border,
                          color: Colors.white70,
                        ),
                        onPressed: controller.toggleFavorite,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  _buildProgressBar(context, controller),
                  SizedBox(height: 12.h),
                  _buildTransportControls(controller),
                  SizedBox(height: 20.h),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.white, size: 28.sp),
          onPressed: () => Get.back(),
        ),
        Expanded(
          child: Text(
            'Playing Now',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 17.sp, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(width: 44.w),
      ],
    );
  }

  Widget _buildProgressBar(BuildContext context, PlayingNowController controller) {
    final position = controller.position.value;
    final duration = controller.duration.value;
    final maxMs = duration.inMilliseconds > 0 ? duration.inMilliseconds.toDouble() : 1.0;
    final valueMs = position.inMilliseconds.clamp(0, maxMs.toInt()).toDouble();

    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 3.h,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.r),
            activeTrackColor: const Color(0xFF29B6F6),
            inactiveTrackColor: Colors.white24,
            thumbColor: const Color(0xFF29B6F6),
          ),
          child: Slider(
            min: 0,
            max: maxMs,
            value: valueMs,
            onChanged: (v) => controller.seek(Duration(milliseconds: v.toInt())),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(controller.formatDuration(position),
                  style: TextStyle(color: Colors.white70, fontSize: 12.sp)),
              Text(controller.formatDuration(duration),
                  style: TextStyle(color: Colors.white70, fontSize: 12.sp)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTransportControls(PlayingNowController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(Icons.shuffle,
              color: controller.isShuffle.value ? const Color(0xFF29B6F6) : Colors.white70,
              size: 20.sp),
          onPressed: controller.toggleShuffle,
        ),
        IconButton(
          icon: Icon(Icons.fast_rewind, color: Colors.white, size: 26.sp),
          onPressed: () {}, // wire to a playlist/queue if you have one
        ),
        GestureDetector(
          onTap: controller.togglePlayPause,
          child: Container(
            width: 56.w,
            height: 56.w,
            decoration: const BoxDecoration(
              color: Color(0xFF29B6F6),
              shape: BoxShape.circle,
            ),
            child: Icon(
              controller.isPlaying.value ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 28.sp,
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.fast_forward, color: Colors.white, size: 26.sp),
          onPressed: () {}, // wire to a playlist/queue if you have one
        ),
        IconButton(
          icon: Icon(Icons.repeat,
              color: controller.isRepeat.value ? const Color(0xFF29B6F6) : Colors.white70,
              size: 20.sp),
          onPressed: controller.toggleRepeat,
        ),
      ],
    );
  }
}