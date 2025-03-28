import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glide/core/utils/theme/app_colors.dart';
import 'package:glide/core/widgets/custom_button.dart';
import 'package:glide/features/schedule/presentation/cubit/selection_cubit.dart';
import 'package:glide/gen/assets.gen.dart';

class ScheduleStepThree extends StatefulWidget {
  const ScheduleStepThree({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  State<ScheduleStepThree> createState() => _ScheduleStepThreeState();
}

class _ScheduleStepThreeState extends State<ScheduleStepThree> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 16.h,
          left: 16.w,
          right: 16.w,
          child: Container(
            height: 100.h,
            width: ScreenUtil().screenWidth,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surface(context),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey(context),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.primary(context),
                            radius: 10.r,
                            child: const Text(
                              'A',
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "Current Location",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF646363),
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.grey(context),
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.primary(context),
                            radius: 10.r,
                            child: const Text(
                              'B',
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "192 Queen Elizabeth",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF646363),
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 87.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: AppColors.grey(context),
                      width: 2.r,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.primary(context),
                        radius: 10.r,
                        child: const Text(
                          '+',
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text('Add',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF646363),
                            fontSize: 16.sp,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewPadding.bottom),
            decoration: BoxDecoration(
              color: AppColors.surface(context),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 10),
              ],
            ),
            child: DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.6,
              maxChildSize: .85,
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
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    ),
                                    icon: Icon(Platform.isIOS
                                        ? Icons.arrow_back_ios
                                        : Icons.arrow_back),
                                    color: AppColors.text(context),
                                  ),
                                  SizedBox(width: 14.w),
                                  Text(
                                    "Select a car",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp,
                                      color: AppColors.text(context),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                children: [
                                  Text(
                                    "Recommended for you",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: AppColors.text(context),
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    height: 20.h,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 4,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(icons[index]),
                                            SizedBox(width: 6.w),
                                            Text(
                                              iconsValues[index],
                                              style: TextStyle(
                                                color: AppColors.text(context),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              BlocProvider(
                                create: (context) => SingleSelectionCubit(),
                                child: BlocBuilder<SingleSelectionCubit, int?>(
                                  builder: (context, selectedIndex) {
                                    bool isSelected = false;
                                    return ListView.builder(
                                      itemCount: 4,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        isSelected = selectedIndex == index;

                                        return InkWell(
                                          onTap: () => context
                                              .read<SingleSelectionCubit>()
                                              .select(index),
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          child: Container(
                                            height: 95.h,
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 22),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                              border: Border.all(
                                                width: 3.w,
                                                color: isSelected
                                                    ? AppColors.primary(context)
                                                    : Colors.transparent,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    Assets.svg.car),
                                                SizedBox(width: 16.w),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'SUV',
                                                      style: TextStyle(
                                                        color: AppColors.text(
                                                            context),
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    SizedBox(height: 8.h),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '7 Min',
                                                          style: TextStyle(
                                                            color:
                                                                AppColors.text(
                                                                    context),
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        SizedBox(width: 8.w),
                                                        Image.asset(Assets
                                                            .png.user.path),
                                                        SizedBox(width: 6.w),
                                                        Text(
                                                          '4',
                                                          style: TextStyle(
                                                            color:
                                                                AppColors.text(
                                                                    context),
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                const Spacer(),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      '19\$',
                                                      style: TextStyle(
                                                        color: AppColors.text(
                                                            context),
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    SizedBox(height: 8.h),
                                                    Text(
                                                      '23\$',
                                                      style: TextStyle(
                                                        color: AppColors.grey(
                                                            context),
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Payment method: ',
                                        style: TextStyle(
                                          color: AppColors.text(context),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Cash',
                                        style: TextStyle(
                                          color: AppColors.text(context),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.sp,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              CustomButton(
                                width: double.maxFinite,
                                textColor: Colors.white,
                                title: 'Continue',
                                onPressed: () {
                                  widget.pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                },
                              ),
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
        ),
      ],
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
final List<String> iconsValues = [
  '5',
  '4',
  '3',
  '4',
];
