import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glide/core/bloc_observer.dart';
import 'package:glide/core/di.dart';
import 'package:glide/core/theme/theme.dart';
import 'package:glide/core/navigation/router.dart';
import 'package:glide/core/utils/helpers/app_preferences.dart';
import 'package:glide/firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await AppPreferences.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  Bloc.observer = MyBlocObserver();

  Future.delayed(
      const Duration(seconds: 2), () => FlutterNativeSplash.remove());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        title: 'Glide',
        debugShowCheckedModeBanner: false,
        theme: customTheme,
        routerConfig: router,
      ),
    );
  }
}
