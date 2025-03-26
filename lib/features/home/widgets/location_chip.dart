import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glide/core/theme/theme.dart';

class LocationChip extends StatelessWidget {
  const LocationChip({
    super.key,
    this.isSelected = false,
    this.hasNumber = false,
    required this.image,
    required this.label,
  });
  final bool isSelected;
  final bool hasNumber;
  final String image;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.lightGrey(context),
        borderRadius: BorderRadius.circular(8.r),
        // border: isSelected
        //     ? Border.all(
        //         color: const Color(0xFF00B894),
        //       )
        //     : null,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            image,
          ),
          SizedBox(width: 4.w),
          Text(
            label,
            style: TextStyle(
              color: AppColors.text(context),
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (hasNumber)
            Container(
              margin: EdgeInsets.only(left: 4.w),
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                '114',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
