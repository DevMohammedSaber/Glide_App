import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glide/core/utils/helpers/snack_bar.dart';
import 'package:glide/core/utils/theme/app_colors.dart';
import 'package:glide/core/widgets/loading_button.dart';
import 'package:glide/features/maps/presentation/cubit/booking_cubit.dart';
import 'package:glide/features/maps/presentation/cubit/booking_states.dart';
import 'package:glide/features/maps/presentation/cubit/map_cubit.dart';
import 'package:glide/features/maps/presentation/cubit/map_states.dart';
import 'package:glide/features/schedule/presentation/cubit/selection_cubit.dart';
import 'package:glide/gen/assets.gen.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    super.key,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  DraggableScrollableController controller = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MapCubit>();
    final bookingCubit = context.read<BookingCubit>();
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
                BlocBuilder<MapCubit, MapStates>(
                  builder: (context, state) {
                    return Expanded(
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
                              Expanded(
                                child: Text(
                                  cubit.selectedAddressOne.isEmpty
                                      ? "Pickup location"
                                      : cubit.selectedAddressOne,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF646363),
                                    fontSize: 16.sp,
                                    overflow: TextOverflow.ellipsis,
                                  ),
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
                              Expanded(
                                child: Text(
                                  cubit.selectedAddressTwo.isEmpty
                                      ? "Dropoff location"
                                      : cubit.selectedAddressTwo,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF646363),
                                    fontSize: 16.sp,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
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
                      InkWell(
                        onTap: () {
                          controller.animateTo(
                            0.85,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text('Add',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF646363),
                              fontSize: 16.sp,
                            )),
                      ),
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
            child: BlocListener<MapCubit, MapStates>(
              listener: (context, state) {
                if (state is MapLoadedState && state.polylines.isNotEmpty) {
                  log(state.polylines.length.toString());
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    controller.animateTo(
                      0.85,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  });
                }
              },
              child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: .05,
                maxChildSize: .85,
                minChildSize: .05,
                controller: controller,
                builder: (context, scrollController) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: const ClampingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: ScreenUtil().screenWidth,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    // vertical: 16,
                                    horizontal: ScreenUtil().screenWidth * .40),
                                child: Container(
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.grey(context),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
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
                            SizedBox(height: 16.h),
                            BlocProvider(
                              create: (context) => SingleSelectionCubit(),
                              child: BlocBuilder<SingleSelectionCubit, int?>(
                                builder: (context, selectedIndex) {
                                  bool isSelected = false;
                                  return ListView.separated(
                                    itemCount: 2,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: 16.h),
                                    itemBuilder: (context, index) {
                                      isSelected = selectedIndex == index;

                                      return InkWell(
                                        onTap: () => context
                                            .read<SingleSelectionCubit>()
                                            .select(index),
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        child: Container(
                                          height: 200.h,
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 22),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.r),
                                            border: Border.all(
                                              width: isSelected ? 3.w : 1.w,
                                              color: isSelected
                                                  ? AppColors.primary(context)
                                                  : AppColors.lightGrey(
                                                      context),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                  Image.asset(
                                                      Assets.png.curp.path),
                                                ],
                                              ),
                                              SizedBox(height: 16.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '7 Min',
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
                                                          Image.asset(Assets
                                                              .png.user.path),
                                                          SizedBox(width: 6.w),
                                                          Text(
                                                            '4',
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .text(
                                                                      context),
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SvgPicture.asset(
                                                      Assets.svg.car),
                                                ],
                                              ),
                                              Divider(
                                                height: 30.h,
                                                color: AppColors.lightGrey(
                                                    context),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '19\$',
                                                    style: TextStyle(
                                                      color: AppColors.text(
                                                          context),
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(width: 16.w),
                                                  Text(
                                                    '23\$',
                                                    style: TextStyle(
                                                      color: AppColors.grey(
                                                          context),
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      decoration: TextDecoration
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
                            BlocListener<BookingCubit, BookingStates>(
                              listener: (context, state) {
                                if (state is BookingSuccessState) {
                                  showSnackBar(
                                    context: context,
                                    color: Colors.green,
                                    title: 'Congrats!',
                                    message: "Booking Successfully",
                                  );
                                } else if (state is BookingErrorState) {
                                  showSnackBar(
                                    context: context,
                                    color: Colors.red,
                                    title: 'On Snap!',
                                    message: state.message,
                                  );
                                }
                              },
                              child: LoadingButton(
                                controller: bookingCubit.btnController,
                                child: const Text(
                                  'Book Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  if (cubit.selectedPoints.length > 1) {
                                    bookingCubit.booking(
                                        dropoffLocation:
                                            cubit.selectedPoints[0],
                                        pickupLocation:
                                            cubit.selectedPoints[1]);
                                  } else {
                                    showSnackBar(
                                      context: context,
                                      color: Colors.red,
                                      title: 'On Snap!',
                                      message:
                                          "Please select pick up and drop off locations!",
                                    );
                                    bookingCubit.btnController.stop();
                                    bookingCubit.btnController.reset();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
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
