import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glide/core/di.dart';
import 'package:glide/features/maps/presentation/cubit/booking_cubit.dart';
import 'package:glide/features/maps/presentation/cubit/map_cubit.dart';
import 'package:glide/features/maps/presentation/widgets/custom_slider.dart';
import 'package:glide/features/maps/presentation/widgets/map_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final PageController _pageController = PageController();

  int currentStep = 0;

  // Widget _buildStep() {
  //   switch (currentStep) {
  //     case 0:
  //       return const ScheduleStepOne();
  //     case 1:
  //       return const ScheduleStepTwo();
  //     case 2:
  //       return const ScheduleStepThree();
  //     case 3:
  //       return const ScheduleStepFour();
  //     default:
  //       return const SizedBox.shrink();
  //   }
  // }

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
        BlocProvider(
          create: (context) => BookingCubit(bookingUsecase: di()),
        ),
      ],
      child: const Scaffold(
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              MapWidget(),
              // _buildStep(),
              CustomSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
