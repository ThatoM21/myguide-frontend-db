import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class FloatingMapButtons extends StatelessWidget {
  const FloatingMapButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 15,
      bottom: 15,
      child: Column(
        children: [

          _buildButton(
            icon: Icons.my_location,
            onPressed: () {
              // Locate user
            },
          ),

          const SizedBox(height: 12),

          _buildButton(
            icon: Icons.add,
            onPressed: () {
              // Zoom In
            },
          ),

          const SizedBox(height: 12),

          _buildButton(
            icon: Icons.remove,
            onPressed: () {
              // Zoom Out
            },
          ),

          const SizedBox(height: 12),

          _buildButton(
            icon: Icons.explore,
            onPressed: () {
              // Compass
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}