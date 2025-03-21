import 'package:flutter/material.dart';
import 'package:glide/core/theme/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = 50,
    this.bgColor,
    this.textColor,
  });

  final String title;
  final VoidCallback? onPressed;
  final double height;
  final Color? bgColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? AppColors.primaryColor,
          foregroundColor: textColor ?? AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
