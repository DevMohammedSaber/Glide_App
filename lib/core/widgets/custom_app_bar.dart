import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glide/core/utils/theme/theme.dart';
import 'package:glide/gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth: 100.w,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, theme) {
            return SvgPicture.asset(
                theme.brightness == Brightness.dark
                    ? Assets.svg.lightGlideLogo
                    : Assets.svg.glide,
                height: 24.h);
          },
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.menu_rounded, size: 32.sp),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
