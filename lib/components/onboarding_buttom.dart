import 'package:flutter/material.dart';
import 'package:mevivu_recipe_app/utils/color_themes.dart';

class OnboardingButton extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onPressed;

  const OnboardingButton({
    required this.title,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor.shade600,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(width: 8),
          Image.asset(iconPath, height: 24),
          
        ],
      ),
    );
  }
}