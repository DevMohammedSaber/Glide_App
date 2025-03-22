import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glide/core/theme/theme.dart';
import 'package:glide/features/home/widgets/home_body.dart';
import 'package:glide/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: const HomeBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
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
