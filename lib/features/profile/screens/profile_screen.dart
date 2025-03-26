import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glide/core/constants/prefs_keys.dart';
import 'package:glide/core/navigation/app_routes.dart';
import 'package:glide/core/theme/theme.dart';
import 'package:glide/core/utils/helpers/app_preferences.dart';
import 'package:glide/core/widgets/custom_app_bar.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundImage: const CachedNetworkImageProvider(
                    'https://i.ibb.co/nMjsMMnX/profile-default.png',
                  ),
                ),
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Welcome, ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            TextSpan(
                              text: 'John',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        '(+${AppPreferences().getString(PrefKeys.userCountryCode)}) ${AppPreferences().getString(PrefKeys.userNumber)}',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey(context),
                            ),
                      ),
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.angleRight,
                      color: AppColors.grey(context),
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              onTap: () {
                                if (index == 1) {
                                  context.push(AppRoutes.walletScreen);
                                }
                              },
                              title: Text(
                                _items[index],
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              trailing: index == 1
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.darkGrey(context),
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25.w, vertical: 8.h),
                                      child: Text(
                                        '137.35\$',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    )
                                  : Icon(
                                      FontAwesomeIcons.angleRight,
                                      color: AppColors.grey(context),
                                      size: 20,
                                    ),
                            ),
                            Divider(color: AppColors.lightGrey(context)),
                          ],
                        );
                      },
                    ),
                  ),
                  Text('V1.162.2',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> _items = [
  'Personal Information',
  'Glide Wallet',
  'Orders',
  'Promotions',
  'Help',
  'Settings',
];
