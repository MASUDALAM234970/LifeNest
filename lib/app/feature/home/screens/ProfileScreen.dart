import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lifenest/app/feature/home/controller/HomeController.dart';

import '../../../routes/routes_name.dart';

// ProfileController and RoutesName are defined at the bottom of this file
// as stubs. If you already have your own versions in your project, delete
// the stubs below and import your real files instead, e.g.:
// import '../routes/routes_name.dart';
// import 'profile_controller.dart';

/// Profile screen — same-to-same UI as the reference design:
/// gradient background, back button + title, profile card with avatar
/// and "Edit Profile" button, 3 stat cards, weekly mood journey strip,
/// settings list (Notifications / Privacy & Legal / Logout), and a
/// floating GetX-driven bottom nav bar (Home / Journal / Chatbot / Profile).
class ProfileScreen extends GetView<Homecontroller> {
  final String name;
  final String avatarUrl; // network/asset image path for the avatar
  final int dayStreak;
  final String listeningTime;
  final int journalEntries;

  /// 7 entries, one emoji per day (Sun..Sat). Pass '' for days with no data.
  final List<String> weekMoodEmojis;
  final int todayIndex; // 0 = Sun ... 6 = Sat, highlights that day

  const ProfileScreen({
    super.key,
    this.name = 'Sohanur Rahman',
    this.avatarUrl = '',
    this.dayStreak = 10,
    this.listeningTime = '15h 30m',
    this.journalEntries = 6,
    this.weekMoodEmojis = const ['😔', '😣', '😔', '😣', '🥲', '😔', '😔'],
    this.todayIndex = 4,
  });

  // GetX controller that tracks which bottom-nav tab is active.
  // Make sure ProfileController is put() somewhere above this screen
  // (e.g. via Get.put/Get.lazyPut in a binding), same as your other screens.
  Homecontroller get controller => Get.find<Homecontroller>();

  static const List<String> _dayLabels = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: SafeArea(
          bottom: false,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
            children: [
              // Top bar
              Row(
                children: [
                  _CircleIconButton(
                    icon: Icons.chevron_left,
                    onTap: () => Navigator.of(context).maybePop(),
                  ),
                  const Expanded(
                    child: Text(
                      'Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 34), // balance back button
                ],
              ),
              const SizedBox(height: 20),

              // Profile card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white24,
                      backgroundImage: avatarUrl.isNotEmpty
                          ? NetworkImage(avatarUrl)
                          : null,
                      child: avatarUrl.isEmpty
                          ? const Icon(Icons.person,
                          color: Colors.white, size: 32)
                          : null,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Stat cards
              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      icon: '🔥',
                      value: '$dayStreak',
                      label: 'Day Streak',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      icon: '⏱️',
                      value: listeningTime,
                      label: 'Listening Time',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      icon: '📗',
                      value: journalEntries.toString().padLeft(2, '0'),
                      label: 'Journal Entries',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Mood journey card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Your mood journey this week',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(7, (i) {
                        final isToday = i == todayIndex;
                        return _DayMood(
                          label: _dayLabels[i],
                          dayNumber: i + 1,
                          emoji: weekMoodEmojis[i],
                          isActive: isToday,
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Settings list
              _SettingsTile(
                icon: Icons.notifications_none,
                label: 'Notifications',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _SettingsTile(
                icon: Icons.lock_outline,
                label: 'Privacy & Legal',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _SettingsTile(
                icon: Icons.logout,
                label: 'Logout',
                isDestructive: true,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),

      /// ✅ Bottom Nav (GetX)
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
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
          child: Obx(() {
            final current = controller.currentIndex.value;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(Icons.home, 0, current),
                _navItem(Icons.menu_book_outlined, 1, current),
                _navItem(Icons.grid_view_outlined, 2, current),
                _navItem(Icons.person_outline, 3, current),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, int index, int current) {
    final isActive = current == index;

    return GestureDetector(
      onTap: () => _onNavTap(index),
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
          color: isActive ? Colors.black : Colors.white,
          size: 24.sp,
        ),
      ),
    );
  }

  void _onNavTap(int index) {
    controller.changeIndex(index);

    switch (index) {
      case 0:
        Get.offAllNamed(RoutesName.home);
        break;
      case 1:
      // Get.offAllNamed(RoutesName.book);
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

class _StatCard extends StatelessWidget {
  final String icon;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _DayMood extends StatelessWidget {
  final String label;
  final int dayNumber;
  final String emoji;
  final bool isActive;

  const _DayMood({
    required this.label,
    required this.dayNumber,
    required this.emoji,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFF7A1FC2) : Colors.white70,
              fontSize: 11,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
          Text(
            '$dayNumber',
            style: TextStyle(
              color: isActive ? const Color(0xFF7A1FC2) : Colors.white70,
              fontSize: 11,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
          const SizedBox(height: 6),
          Text(emoji, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  const _SettingsTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDestructive ? const Color(0xFFFF6B6B) : Colors.white;

    return Material(
      color: Colors.white.withOpacity(0.12),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, color: color.withOpacity(0.6), size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.2),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}


class ProfileController extends GetxController {
  final currentIndex = 3.obs; // Profile tab is index 3 / active by default

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}

/// Route name stubs — replace with your actual RoutesName class/values.
// class RoutesName {
//   static const String home = '/home';
//   static const String book = '/book';
//   static const String chatbot = '/chatbot';
//   static const String profile = '/profile';
// }