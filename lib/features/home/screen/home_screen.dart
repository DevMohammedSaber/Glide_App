import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glide/core/theme/theme.dart';
import 'package:glide/features/home/widgets/slider_widget.dart';
import 'package:glide/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 100.w,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SvgPicture.asset(Assets.svg.darkGlideLogo, height: 24.h),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.menu_rounded, size: 32.sp),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            const SliderWidget(),
            SizedBox(height: 16.h),
            buildServicesGrid(),
            SizedBox(height: 24.h),
            buildDailyRideCard(),
            SizedBox(height: 24.h),
            buildTagline(),
            SizedBox(height: 16.h),
            buildSearchBar(),
            SizedBox(height: 16.h),
            buildRecentLocations(),
            SizedBox(height: 40.h), // Extra space for bottom navigation
          ],
        ),
      ),
    );
  }

  Widget buildPromotionCarousel() {
    return SizedBox(
      height: 150.h,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          buildPromotionCard(
            color: const Color(0xFFFFC166),
            title: 'GET YOUR SWEET\nICE CREAM',
            subtitle: '40% OFF',
            hasIceCream: true,
          ),
          SizedBox(width: 12.w),
          buildPromotionCard(
            color: Colors.black,
            title: 'COUPLES ONLY',
            subtitle: 'Double the\nhappiness',
            hasIceCream: false,
            isWhiteText: true,
          ),
        ],
      ),
    );
  }

  Widget buildPromotionCard({
    required Color color,
    required String title,
    required String subtitle,
    required bool hasIceCream,
    bool isWhiteText = false,
  }) {
    return Container(
      width: 250.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: hasIceCream
                  ? Icon(
                      Icons.icecream,
                      color: Colors.white,
                      size: 48.sp,
                    )
                  : Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 48.sp,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildServicesGrid() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildServiceItem(image: Assets.svg.taxi, label: 'Taxi'),
            buildServiceItem(image: Assets.svg.bus, label: 'Bus'),
            buildServiceItem(image: Assets.svg.elder, label: 'Elderly Bus'),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildServiceItem(image: Assets.svg.food, title: 'Food', label: ''),
            buildServiceItem(
                image: Assets.svg.market, title: 'Market', label: ''),
            buildServiceItem(
                image: Assets.svg.medicine, title: 'Medicine', label: ''),
            buildServiceItem(image: Assets.svg.more, title: 'More', label: ''),
          ],
        ),
      ],
    );
  }

  Widget buildServiceItem(
      {required String image, required String label, String? title}) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: title == null ? 110.h : 82.h,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                SizedBox(
                  height: 45.h,
                  child: SvgPicture.asset(
                    image,
                  ),
                ),
                SizedBox(height: 10.h),
                if (title == null)
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                const Spacer(),
              ],
            ),
          ),
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildDailyRideCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFF00B894),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Need a daily ride?',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Icon(FontAwesomeIcons.calendar,
                      color: Colors.white, size: 14.sp),
                  SizedBox(width: 4.w),
                  Text(
                    'Schedule once, ride every day!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: const Color(0xFF00EBC3),
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              'Schedule Now',
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTagline() {
    return Text(
      "Wherever you're going, let's get you there!",
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        color: Colors.black87,
      ),
    );
  }

  Widget buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.grey[200],
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
          SvgPicture.asset(Assets.svg.search),
          SizedBox(width: 8.w),
          Text(
            'Where to go...',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecentLocations() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          buildLocationChip(Assets.svg.home, 'Home', isSelected: true),
          SizedBox(width: 8.w),
          buildLocationChip(Assets.svg.work, 'Work'),
          SizedBox(width: 8.w),
          buildLocationChip(Assets.svg.buildings, '192 Queen Elizabeth',
              hasNumber: true),
          SizedBox(width: 8.w),
          buildLocationChip(Assets.svg.buildings, '114 Sinaa Street'),
        ],
      ),
    );
  }

  Widget buildLocationChip(String image, String label,
      {bool isSelected = false, bool hasNumber = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.grey[200],
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
              color: Colors.black87,
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

  Widget buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF00B894),
        unselectedItemColor: Colors.grey[400],
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              width: 32.w,
              height: 32.h,
              Assets.svg.home,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.svg.history,
              width: 32.w,
              height: 32.h,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              width: 32.w,
              height: 32.h,
              Assets.svg.profile,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
