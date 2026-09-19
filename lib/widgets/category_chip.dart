import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CategoryChip extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback? onTap;

  const CategoryChip({
    super.key,
    required this.title,
    required this.icon,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.accent
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.accent.withValues(alpha: 0.15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 15,
              color: selected
                  ? Colors.white
                  : AppColors.accent,
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: TextStyle(
                color: selected
                    ? Colors.white
                    : Colors.black87,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}