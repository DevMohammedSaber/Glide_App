import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glide/core/utils/constants/prefs_keys.dart';
import 'package:glide/core/utils/helpers/app_preferences.dart';
import 'package:glide/core/utils/navigation/app_routes.dart';
import 'package:glide/core/utils/theme/app_colors.dart';
import 'package:glide/core/utils/theme/theme.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      elevation: 20,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.background(context),
            ),
            accountName: Text("John Doe",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppColors.text(context))),
            accountEmail: Text("johndoe@example.com",
                style: Theme.of(context).textTheme.bodyMedium),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Text("JD",
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
          ),
          DrawerItem(
            icon: Icons.home,
            title: "Home",
            onTap: () {
              Scaffold.of(context).closeEndDrawer();
            },
          ),
          DrawerItem(
            icon: Icons.person,
            title: "Profile",
            onTap: () {},
          ),
          DrawerItem(
            icon: Icons.settings,
            title: "Settings",
            onTap: () {},
          ),
          const Divider(height: 20),
          DrawerItem(
            icon: Icons.notifications,
            title: "Notifications",
            badgeCount: 3,
            onTap: () {},
          ),
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.lightPrimary(context),
                borderRadius: BorderRadius.circular(10),
              ),
              child:
                  Icon(Icons.brightness_6, color: AppColors.primary(context)),
            ),
            title: Text("Dark Mode",
                style: Theme.of(context).textTheme.titleMedium),
            trailing: Switch(
              value: context.watch<ThemeCubit>().state.brightness ==
                  Brightness.dark,
              onChanged: (value) => context.read<ThemeCubit>().toggleTheme(),
              activeColor: AppColors.lightPrimary(context),
            ),
          ),
          const Divider(height: 20),
          DrawerItem(
            icon: Icons.logout,
            title: "Logout",
            onTap: () {
              AppPreferences().clear();
              AppPreferences().setBool(PrefKeys.isOnboarding, true);
              context.go(AppRoutes.authenticationScreen);
            },
          ),
          const Divider(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text("App Version 1.0.0",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.text(context))),
                const SizedBox(height: 10),
                Text("© 2025 Adam Express",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.text(context))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key,
      required this.icon,
      required this.title,
      this.iconColor,
      this.badgeCount,
      this.onTap});
  final IconData icon;
  final String title;
  final Color? iconColor;
  final int? badgeCount;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor ?? Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Icon(icon,
                color: iconColor ?? Theme.of(context).colorScheme.primary),
            if (badgeCount != null)
              Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6)),
                  constraints: const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$badgeCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      trailing: Icon(Icons.chevron_right,
          color: Theme.of(context).colorScheme.primary),
      onTap: onTap,
    );
  }
}
