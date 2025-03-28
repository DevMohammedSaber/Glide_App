import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glide/features/schedule/presentation/cubit/map_cubit.dart';
import 'package:glide/features/schedule/presentation/screens/schedule_step_four.dart';
import 'package:glide/features/schedule/presentation/screens/schedule_step_one.dart';
import 'package:glide/features/schedule/presentation/screens/schedule_step_three.dart';
import 'package:glide/features/schedule/presentation/screens/schedule_step_two.dart';
import 'package:glide/gen/assets.gen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final PageController _pageController = PageController();
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapCubit(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.png.mapBg.path),
                fit: BoxFit.cover,
              ),
            ),
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ScheduleStepOne(
                  pageController: _pageController,
                ),
                ScheduleStepTwo(
                  pageController: _pageController,
                ),
                ScheduleStepThree(
                  pageController: _pageController,
                ),
                ScheduleStepFour(
                  pageController: _pageController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
