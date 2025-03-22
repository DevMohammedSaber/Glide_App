import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glide/core/theme/theme.dart';
import 'package:glide/features/history/screen/history_screen.dart';
import 'package:glide/features/home/screen/home_screen.dart';
import 'package:glide/features/layout/cubit/layout_cubit.dart';
import 'package:glide/features/profile/screen/profile_screen.dart';
import 'package:glide/gen/assets.gen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: state,
              children: const [
                HomeScreen(),
                HistoryScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: Container(
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
                selectedFontSize: 14.sp,
                unselectedFontSize: 12.sp,
                currentIndex: state,
                onTap: (value) =>
                    context.read<LayoutCubit>().changeLayout(value),
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      width: 32.w,
                      height: 32.h,
                      state == 0
                          ? Assets.svg.homeFilled
                          : Assets.svg.homeOutlined,
                      colorFilter: state == 0
                          ? const ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            )
                          : null,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      state == 1
                          ? Assets.svg.historyFilled
                          : Assets.svg.history,
                      width: 32.w,
                      height: 32.h,
                      colorFilter: state == 1
                          ? const ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            )
                          : null,
                    ),
                    label: 'History',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      width: 32.w,
                      height: 32.h,
                      state == 2
                          ? Assets.svg.profileFilled
                          : Assets.svg.profile,
                      colorFilter: state == 2
                          ? const ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            )
                          : null,
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
