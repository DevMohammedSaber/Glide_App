import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glide/core/utils/theme/app_colors.dart';
import 'package:glide/features/profile/widgets/wallet_screen_body.dart';
import 'package:glide/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';

class ScheduleStepFour extends StatefulWidget {
  const ScheduleStepFour({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  State<ScheduleStepFour> createState() => _ScheduleStepFourState();
}

class _ScheduleStepFourState extends State<ScheduleStepFour> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
        decoration: BoxDecoration(
          color: AppColors.surface(context),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 10),
          ],
        ),
        child: DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.95,
          maxChildSize: .95,
          builder: (context, scrollController) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: ScreenUtil().screenWidth,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: const ClampingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: ScreenUtil().screenWidth * .43),
                        child: Container(
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: AppColors.grey(context),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () =>
                                    widget.pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                ),
                                icon: Icon(Platform.isIOS
                                    ? Icons.arrow_back_ios
                                    : Icons.arrow_back),
                                color: AppColors.text(context),
                              ),
                              SizedBox(width: 14.w),
                              Text(
                                "Payment method",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                  color: AppColors.text(context),
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () => context.pop(),
                                child: Text(
                                  'Done',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          const WalletScreenBody(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

final List<String> keys = [
  'Adults - \$ 9',
  'Elders - \$ 5',
  'Children - \$ 0',
  'Animals - \$ 9',
  'Luggage - \$ 2',
];
final List<String> values = [
  '( 10 to 60 Years old )',
  '( Above 60 Year old )',
  'under‘ 10 years of age accompanied by an adult going to the same place are to be carried free',
  'Carrying animals loose or in cages will be charged full adult rate.',
  'more than 2 pieces of luggage or packages/boxes, but shall not include grocery bagged items ',
];

final List<String> values2 = [
  '( 10 to 60 Years old )',
  '( Above 60 Year old )',
  'under‘ 10 years of age accompanied by an adult going to the same place are to be carried free',
  'Carrying animals loose or in cages will be charged full adult rate.',
  'more than 2 pieces of luggage or packages/boxes, but shall not include grocery bagged items ',
];
final List<String> icons = [
  Assets.png.user.path,
  Assets.png.disability.path,
  Assets.png.baby.path,
  Assets.png.luggage.path,
];
final List<String> iconsKeys = [
  '5',
  '4',
  '3',
  '4',
];
