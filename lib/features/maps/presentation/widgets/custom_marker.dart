import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMarkerWidget extends StatelessWidget {
  final String label;
  const CustomMarkerWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 80.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.h, bottom: 10.h),
            child: VerticalDivider(
              color: const Color(0xFF00C9A7),
              thickness: 8.h,
              width: 14.w,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 16.w,
              height: 16.h,
              decoration: const BoxDecoration(
                color: Color(0xFF00C9A7),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: const Color(0xFF00C9A7),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
