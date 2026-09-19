import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: AppColors.card,
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(
              index: 0,
              icon: Icons.home_rounded,
              label: "Home",
            ),

            _buildNavItem(
              index: 1,
              icon: Icons.explore_rounded,
              label: "Explore",
            ),

            _buildNavItem(
              index: 2,
              icon: Icons.favorite_rounded,
              label: "Favorites",
            ),

            _buildNavItem(
              index: 3,
              icon: Icons.menu_rounded,
              label: "Menu",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final bool selected = selectedIndex == index && index != 3;

    return InkWell(
      onTap: () => onItemTapped(index),
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.accent.withValues(alpha: 0.18)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 28,
              color: selected
                  ? AppColors.accent
                  : Colors.white60,
            ),

            const SizedBox(height: 4),

            Text(
              label,
              style: TextStyle(
                color: selected
                    ? AppColors.accent
                    : Colors.white60,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}