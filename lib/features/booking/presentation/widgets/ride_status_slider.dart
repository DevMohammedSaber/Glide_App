import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glide/core/utils/helpers/snack_bar.dart';
import 'package:glide/core/utils/navigation/app_routes.dart';
import 'package:glide/core/utils/theme/app_colors.dart';
import 'package:glide/core/widgets/custom_button.dart';
import 'package:glide/core/widgets/custom_dialog.dart';
import 'package:glide/core/widgets/loading_button.dart';
import 'package:glide/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:glide/features/booking/presentation/cubit/booking_states.dart';
import 'package:glide/features/booking/presentation/widgets/rating_dialog.dart';
import 'package:glide/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class RideStatusWidget extends StatefulWidget {
  const RideStatusWidget({super.key});

  @override
  State<RideStatusWidget> createState() => _RideStatusWidgetState();
}

class _RideStatusWidgetState extends State<RideStatusWidget> {
  @override
  Widget build(BuildContext context) {
    final bookingCubit = BlocProvider.of<BookingCubit>(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          showCustomDialog(
            context: context,
            height: 190.h,
            onClosePressed: () => Navigator.pop(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16.h),
                Text(
                  "Are you sure you want to cancel this ride?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        title: "Yes",
                        onPressed: () {
                          bookingCubit.cancelRide(
                              bookingId: bookingCubit.rideId);
                          context.push(AppRoutes.layoutScreen);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomButton(
                        title: "No",
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewPadding.bottom),
          decoration: BoxDecoration(
            color: AppColors.surface(context),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 10),
            ],
          ),
          child: DraggableScrollableSheet(
            expand: false,
            maxChildSize: .25,
            initialChildSize: .25,
            builder: (context, _) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: ScreenUtil().screenWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().screenWidth * .40),
                        child: Container(
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: AppColors.grey(context),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    BlocBuilder<BookingCubit, BookingStates>(
                      builder: (context, state) {
                        if (state is RideStatusSuccessState) {
                          return Expanded(
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Your ride is on the way",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        RichText(
                                            text: TextSpan(
                                          text: "Ride Status: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          children: [
                                            WidgetSpan(
                                              child:
                                                  Builder(builder: (context) {
                                                String status = state.rideStatus
                                                            .status ==
                                                        'assigned'
                                                    ? 'Assigned'
                                                    : state.rideStatus.status ==
                                                            'in_progress'
                                                        ? 'In Progress'
                                                        : state.rideStatus
                                                                    .status ==
                                                                'completed'
                                                            ? 'Completed'
                                                            : 'Requested';
                                                return Text(
                                                  status,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                          color: status ==
                                                                  'Requested'
                                                              ? Colors.amber
                                                              : status ==
                                                                      'Assigned'
                                                                  ? Colors.amber
                                                                  : status ==
                                                                          'Assigned'
                                                                      ? Colors
                                                                          .green
                                                                      : Colors
                                                                          .green),
                                                );
                                              }),
                                            ),
                                          ],
                                        )),
                                        if (state.rideStatus.driver?.name !=
                                            null)
                                          Text(
                                            "Driver Name: ${state.rideStatus.driver?.name ?? ''}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        if (state.rideStatus.driver?.phone !=
                                            null)
                                          Text(
                                            "Driver Phone: ${state.rideStatus.driver?.phone ?? ''}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                      ],
                                    ),
                                    SvgPicture.asset(Assets.svg.car),
                                  ],
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 16.w,
                                  right: 16.w,
                                  child:
                                      BlocListener<BookingCubit, BookingStates>(
                                    listener: (context, state) {
                                      if (state is CancelRideSuccessState) {
                                        showSnackBar(
                                          context: context,
                                          color: Colors.green,
                                          title: 'Success!',
                                          message: "Ride Cancel Successfully",
                                        );
                                      } else if (state
                                              is RideStatusSuccessState &&
                                          state.rideStatus.status ==
                                              'completed') {
                                        showRatingDialog(
                                          context: context,
                                          rideId: state.rideStatus.id,
                                        );
                                      }
                                    },
                                    child: LoadingButton(
                                      controller:
                                          RoundedLoadingButtonController(),
                                      animateOnTap: false,
                                      bgColor: state.rideStatus.status !=
                                                  'requested' &&
                                              state.rideStatus.status !=
                                                  'assigned'
                                          ? Colors.grey
                                          : Colors.red,
                                      onPressed: () {
                                        if (state.rideStatus.status ==
                                                'requested' ||
                                            state.rideStatus.status ==
                                                'assigned') {
                                          bookingCubit.cancelRide(
                                              bookingId: state.rideStatus.id);
                                        } else {
                                          showSnackBar(
                                            context: context,
                                            color: Colors.red,
                                            title: 'On Snap!',
                                            message:
                                                'Sorry, you can not cancel now',
                                          );
                                          bookingCubit.cancelBtnController
                                              .stop();
                                          bookingCubit.cancelBtnController
                                              .reset();
                                        }
                                      },
                                      child: const Text(
                                        "Cancel Ride",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return const Expanded(
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
