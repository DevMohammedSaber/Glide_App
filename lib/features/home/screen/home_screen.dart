import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glide/core/utils/theme/app_colors.dart';
import 'package:glide/features/home/widgets/daily_ride_card.dart';
import 'package:glide/features/home/widgets/location_chip.dart';
import 'package:glide/features/home/widgets/services_grid_view.dart';
import 'package:glide/features/home/widgets/slider_widget.dart';
import 'package:glide/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: ScreenUtil().screenHeight * .57,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SliderWidget(),
                const ServicesGridView(),
                const DailyRideCard(),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            child: Container(
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
                initialChildSize: 0.25,
                maxChildSize: 0.97,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Wherever you're going, let's get you there!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: AppColors.text(context),
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 12.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGrey(context),
                                    borderRadius: BorderRadius.circular(12.r),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        Assets.svg.search,
                                        colorFilter: ColorFilter.mode(
                                          AppColors.text(context),
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        'Where to go...',
                                        style: TextStyle(
                                          color: AppColors.text(context),
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  child: Row(
                                    children: [
                                      LocationChip(
                                          image: Assets.svg.home,
                                          label: 'Home',
                                          isSelected: true),
                                      SizedBox(width: 8.w),
                                      LocationChip(
                                          image: Assets.svg.work,
                                          label: 'Work',
                                          isSelected: true),
                                      SizedBox(width: 8.w),
                                      LocationChip(
                                          image: Assets.svg.buildings,
                                          label: '192 Queen Elizabeth',
                                          isSelected: true),
                                      SizedBox(width: 8.w),
                                      LocationChip(
                                          image: Assets.svg.buildings,
                                          label: '114 Sinaa Street',
                                          isSelected: true),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                ListView.separated(
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    if (index == 4) {
                                      return ListTile(
                                        contentPadding: const EdgeInsets.all(0),
                                        title: Text(
                                          'Select location on map',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        subtitle: Text(
                                          'Drop a pin to choose destination',
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        trailing: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: AppColors.lightGrey(context),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: const Icon(
                                            Icons.location_on,
                                          ),
                                        ),
                                      );
                                    }
                                    return ListTile(
                                      contentPadding: const EdgeInsets.all(0),
                                      title: Text(
                                        '192 Queen Elizabeth',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      subtitle: Text(
                                        'Iqaluit, NU, Canada',
                                        style: TextStyle(
                                          color: AppColors.grey(context),
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      trailing: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: AppColors.lightGrey(context),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: const Icon(
                                          Icons.favorite,
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) => Divider(
                                    height: 1,
                                    color: AppColors.grey(context),
                                  ),
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
        ),
      ],
    );
  }
}
