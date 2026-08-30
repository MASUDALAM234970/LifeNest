import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/MusicListController.dart';
import '../model/MusicModel.dart';
import 'PlayingNowScreen.dart';

class MusicTherapyScreen extends StatelessWidget {
  const MusicTherapyScreen({super.key});

  static const List<String> _tabs = [
    'All',
    'Favorites',
    'Sleep',
    'Focus',
    'Natural',
    'instrumental',
    'emotional_healing',
  ];

  @override
  Widget build(BuildContext context) {
    final controller = MusicListController.instance;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFB3175E),
              Color(0xFF3B1E8C),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),

              SizedBox(height: 12.h),

              _buildTabs(controller),

              SizedBox(height: 14.h),

              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }

                  final list = controller.filteredList;

                  if (list.isEmpty) {
                    return _buildEmptyState(
                      controller.selectedTab.value,
                    );
                  }

                  return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(
                      16.w,
                      0,
                      16.w,
                      20.h,
                    ),
                    itemCount: list.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      childAspectRatio: 0.78,
                    ),
                    itemBuilder: (context, index) {
                      final music = list[index];

                      return _MusicCard(
                        music: music,
                        isFavorite:
                        controller.isFavorite(music.id),
                        onFavoriteTap: () {
                          controller.toggleFavorite(music.id);
                        },
                        onTap: () {
                          Get.to(
                                () => PlayingNowScreen(
                              musicId: music.id,
                            ),
                          );
                        },
                      );
                    },
                  );
                }),
              ),

              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 28.sp,
            ),
            onPressed: () {
              Get.back();
            },
          ),

          Expanded(
            child: Text(
              'Music Therapy',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(width: 48.w),
        ],
      ),
    );
  }

  Widget _buildTabs(MusicListController controller) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        itemCount: _tabs.length,
        itemBuilder: (context, index) {
          final tab = _tabs[index];

          return Obx(() {
            final isSelected =
                controller.selectedTab.value == tab;

            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                controller.changeTab(tab);
              },
              child: Container(
                margin: EdgeInsets.only(
                  right: 20.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _formatTabName(tab),
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : Colors.white54,
                        fontSize: 14.sp,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 5.h),

                    AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      height: 2.h,
                      width: isSelected ? 22.w : 0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(10.r),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }

  String _formatTabName(String tab) {
    switch (tab) {
      case 'emotional_healing':
        return 'Emotional Healing';

      case 'instrumental':
        return 'Instrumental';

      default:
        return tab;
    }
  }

  Widget _buildEmptyState(String selectedTab) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              selectedTab == 'Favorites'
                  ? Icons.favorite_border
                  : Icons.music_off_rounded,
              color: Colors.white54,
              size: 55.sp,
            ),

            SizedBox(height: 14.h),

            Text(
              selectedTab == 'Favorites'
                  ? 'No favorite tracks yet'
                  : 'No tracks found',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 6.h),

            Text(
              selectedTab == 'Favorites'
                  ? 'Add your favorite music to see it here.'
                  : 'There are no tracks in this category yet.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MusicCard extends StatelessWidget {
  final MusicModel music;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onTap;

  const _MusicCard({
    required this.music,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              music.banner,
              fit: BoxFit.cover,
              loadingBuilder:
                  (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return Container(
                  color: Colors.white10,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white54,
                      strokeWidth: 2,
                    ),
                  ),
                );
              },
              errorBuilder: (
                  context,
                  error,
                  stackTrace,
                  ) {
                return Container(
                  color: Colors.white10,
                  child: Center(
                    child: Icon(
                      Icons.music_note_rounded,
                      color: Colors.white38,
                      size: 42.sp,
                    ),
                  ),
                );
              },
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.75),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 8.h,
              left: 8.w,
              child: _pill(
                icon: Icons.music_note_rounded,
                label: 'Music',
              ),
            ),

            Positioned(
              top: 7.h,
              right: 7.w,
              child: Material(
                color: Colors.black38,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onFavoriteTap,
                  child: Padding(
                    padding: EdgeInsets.all(7.w),
                    child: Icon(
                      isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: isFavorite
                          ? Colors.pinkAccent
                          : Colors.white,
                      size: 18.sp,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: 10.w,
              right: 10.w,
              bottom: 10.h,
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    music.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      shadows: const [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 5.h),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 7.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius:
                      BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      _formatCategory(music.category),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatCategory(String category) {
    switch (category.toLowerCase()) {
      case 'emotional_healing':
        return 'Emotional Healing';

      case 'instrumental':
        return 'Instrumental';

      case 'natural':
        return 'Natural';

      default:
        return category;
    }
  }

  Widget _pill({
    required IconData icon,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 10.sp,
          ),
          SizedBox(width: 4.w),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 9.sp,
            ),
          ),
        ],
      ),
    );
  }
}