import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glide/features/maps/presentation/cubit/map_cubit.dart';
import 'package:glide/features/maps/presentation/widgets/map_widget.dart';
import 'package:glide/features/booking_ride/presentation/screens/schedule_step_three.dart';
import 'package:glide/features/booking_ride/presentation/screens/schedule_step_two.dart';
import 'package:glide/features/schedule/presentation/screens/schedule_step_four.dart';
import 'package:glide/features/schedule/presentation/screens/schedule_step_one.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final PageController _pageController = PageController();

  int currentStep = 0;

  Widget _buildStep() {
    switch (currentStep) {
      case 0:
        return ScheduleStepOne(pageController: _pageController);
      case 1:
        return ScheduleStepTwo(pageController: _pageController);
      case 2:
        return ScheduleStepThree(pageController: _pageController);
      case 3:
        return ScheduleStepFour(pageController: _pageController);
      default:
        return const SizedBox.shrink();
    }
  }

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
          child: Stack(
            children: [
              const MapWidget(),
              _buildStep(),
            ],
          ),
        ),
      ),
    );
  }
}
