import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  String _greeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning 👋";
    } else if (hour < 17) {
      return "Good Afternoon ☀️";
    } else {
      return "Good Evening 🌙";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Picture
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ProfileScreen(),
              ),
            );
          },
          child: const CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.accent,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),

        const SizedBox(height: 25),

        Text(
          _greeting(),
          style: AppTextStyles.greeting,
        ),

        const SizedBox(height: 6),

        const Text(
          "Welcome to MyGuide",
          style: AppTextStyles.title,
        ),

        const SizedBox(height: 10),

        const Row(
          children: [
            Icon(
              Icons.location_on,
              color: AppColors.accent,
              size: 18,
            ),
            SizedBox(width: 6),
            Text(
              "Pretoria Central",
              style: AppTextStyles.subtitle,
            ),
          ],
        ),
      ],
    );
  }
}