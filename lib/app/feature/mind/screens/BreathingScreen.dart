import 'package:flutter/material.dart';
import 'dart:async';

import 'package:lifenest/app/constant/AppTextStyle.dart';

/// Full-screen "Breathing" exercise UI — same as the reference design:
/// pink→purple gradient background, back button, animated pulsing
/// concentric circles, "Breath In..." label, mm:ss / total timer,
/// and pause + close circular buttons at the bottom.
class BreathingScreen extends StatefulWidget {
  final Duration totalDuration;

  const BreathingScreen({
    super.key,
    this.totalDuration = const Duration(minutes: 5),
  });

  @override
  State<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  Timer? _timer;
  late Duration _elapsed;
  bool _isPaused = false;
  bool _isBreathingIn = true;

  @override
  void initState() {
    super.initState();
    _elapsed = const Duration(seconds: 85); // matches 01:25 in the design

    // Pulsing scale animation for the concentric circles.
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _pulseController.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        setState(() => _isBreathingIn = !_isBreathingIn);
      }
    });

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isPaused) return;
      if (_elapsed >= widget.totalDuration) {
        timer.cancel();
        return;
      }
      setState(() => _elapsed += const Duration(seconds: 1));
    });
  }

  void _togglePause() {
    setState(() => _isPaused = !_isPaused);
    if (_isPaused) {
      _pulseController.stop();
    } else {
      _pulseController.repeat(reverse: true);
    }
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: SafeArea(
          child: Column(
            children: [
              // Top bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    _CircleIconButton(
                      icon: Icons.chevron_left,
                      onTap: () => Navigator.of(context).maybePop(),
                      background: Colors.white.withOpacity(0.15),
                      iconColor: Colors.white,
                    ),
                    Expanded(
                      child: Text(
                        'Breathing',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.mango70018cur
                      ),
                    ),
                    const SizedBox(width: 44), // balance the back button
                  ],
                ),
              ),

              const Spacer(flex: 3),

              // Pulsing concentric circles
              AnimatedBuilder(
                animation: _pulseAnimation,
                builder: (context, child) {
                  return SizedBox(
                    width: 300,
                    height: 300,
                    child: Center(
                      child: _PulsingCircles(scale: _pulseAnimation.value),
                    ),
                  );
                },
              ),

              const Spacer(flex: 2),

              // Status label
              Text(
                _isPaused
                    ? 'Paused'
                    : (_isBreathingIn ? 'Breath In...' : 'Breath Out...'),
                style: AppTextStyle.mango70016sos
              ),
              const SizedBox(height: 12),

              // Timer
              Text(
                '${_formatDuration(_elapsed)} / ${_formatDuration(widget.totalDuration)}',
                style: AppTextStyle.mango40014breath
              ),

              const Spacer(flex: 2),

              // Controls
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _CircleIconButton(
                      icon: _isPaused ? Icons.play_arrow : Icons.pause,
                      onTap: _togglePause,
                      background: Colors.white.withOpacity(0.08),
                      borderColor: const Color(0xFF6C7BFF),
                      iconColor: const Color(0xFF6C7BFF),
                      size: 64,
                    ),
                    const SizedBox(width: 28),
                    _CircleIconButton(
                      icon: Icons.close,
                      onTap: () => Navigator.of(context).maybePop(),
                      background: Colors.white.withOpacity(0.08),
                      borderColor: const Color(0xFF6C7BFF),
                      iconColor: const Color(0xFF6C7BFF),
                      size: 64,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Four concentric translucent circles that scale together, giving the
/// "breathing" pulse effect from the design.
class _PulsingCircles extends StatelessWidget {
  final double scale;

  const _PulsingCircles({required this.scale});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _ringCircle(280, Colors.white.withOpacity(0.08)),
          _ringCircle(220, Colors.white.withOpacity(0.10)),
          _ringCircle(160, Colors.white.withOpacity(0.14)),
          _ringCircle(100, Colors.white.withOpacity(0.18)),
          _ringCircle(50, Colors.white.withOpacity(0.25)),
        ],
      ),
    );
  }

  Widget _ringCircle(double diameter, Color color) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

/// Reusable circular icon button used for back/pause/close controls.
class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color background;
  final Color iconColor;
  final Color? borderColor;
  final double size;

  const _CircleIconButton({
    required this.icon,
    required this.onTap,
    required this.background,
    required this.iconColor,
    this.borderColor,
    this.size = 44,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: background,
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 2)
              : null,
        ),
        child: Icon(icon, color: iconColor, size: size * 0.45),
      ),
    );
  }
}

// Example usage:
//
// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (_) => const BreathingScreen()),
// );