import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glide/core/di.dart';
import 'package:glide/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:glide/features/booking/presentation/cubit/booking_states.dart';
import 'package:glide/features/booking/presentation/cubit/map_cubit.dart';
import 'package:glide/features/booking/presentation/widgets/booking_slider.dart';
import 'package:glide/features/booking/presentation/widgets/map_widget.dart';
import 'package:glide/features/booking/presentation/widgets/ride_status_slider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapCubit(),
        ),
        BlocProvider(
          create: (context) => BookingCubit(
            bookingUsecase: di(),
            rideStatusUsecase: di(),
            cancelRideUsecase: di(),
          ),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              const MapWidget(),
              // _buildStep(),
              BlocBuilder<BookingCubit, BookingStates>(
                builder: (context, state) {
                  if (state is RideStatusSuccessState ) {
                    return RideStatusWidget();
                  } else {
                    return CustomSlider();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
