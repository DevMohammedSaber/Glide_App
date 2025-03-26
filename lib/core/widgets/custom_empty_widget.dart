import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glide/core/widgets/custom_button.dart';
import 'package:glide/gen/assets.gen.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.png.empty.path,
        ),
        SizedBox(height: 16.h),
        Text(
          'Ready to get moving?',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        SizedBox(height: 16.h),
        Text(
          'Book a ride or place an order now \nand let’s get started!',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 32.h),
        CustomButton(
          width: ScreenUtil().screenWidth * .5,
          height: 50.h,
          title: 'Explore Services',
          onPressed: () {},
        ),
      ],
    );
  }
}
