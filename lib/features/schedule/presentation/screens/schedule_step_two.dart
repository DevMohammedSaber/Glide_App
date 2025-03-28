import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glide/core/utils/theme/app_colors.dart';
import 'package:glide/core/widgets/custom_button.dart';
import 'package:glide/features/schedule/presentation/cubit/counter_cubit.dart';

class ScheduleStepTwo extends StatefulWidget {
  const ScheduleStepTwo({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  State<ScheduleStepTwo> createState() => _ScheduleStepTwoState();
}

class _ScheduleStepTwoState extends State<ScheduleStepTwo> {
  List<TextEditingController> controllers =
      List.filled(keys.length, TextEditingController(text: '0'));
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
        decoration: BoxDecoration(
          color: AppColors.surface(context),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 10),
          ],
        ),
        child: DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.85,
          maxChildSize: 0.97,
          builder: (context, scrollController) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: ScreenUtil().screenWidth,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: const ClampingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: ScreenUtil().screenWidth * .43),
                        child: Container(
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: AppColors.grey(context),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () =>
                                    widget.pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                ),
                                icon: Icon(Platform.isIOS
                                    ? Icons.arrow_back_ios
                                    : Icons.arrow_back),
                                color: AppColors.text(context),
                              ),
                              SizedBox(width: 14.w),
                              Text(
                                "Select Ride Details",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                  color: AppColors.text(context),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          BlocProvider(
                            create: (context) => CounterCubit(),
                            child: BlocBuilder<CounterCubit, int>(
                              builder: (context, state) {
                                return ListView.separated(
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      contentPadding: const EdgeInsets.all(0),
                                      title: Text(
                                        keys[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      subtitle: Text(
                                        values[index],
                                        style: TextStyle(
                                          color: AppColors.grey(context),
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            // onTap: () =>
                                            //     context.read<CounterCubit>().decrement(),
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: AppColors.lightGrey(
                                                    context),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: const Icon(
                                                Icons.remove,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 60.w,
                                            child: TextFormField(
                                              controller: controllers[index],
                                              textAlign: TextAlign.center,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              decoration: const InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(20),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            // onTap: () =>
                                            //     context.read<CounterCubit>().increment(),
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: AppColors.lightGrey(
                                                    context),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) => Divider(
                                    height: 1,
                                    color: AppColors.grey(context),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 16.h),
                          const Text('Note'),
                          SizedBox(height: 16.h),
                          TextFormField(
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 3,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.lightGrey(context),
                              contentPadding: const EdgeInsets.all(20),
                              hintText: 'Write your note here for the driver',
                              hintStyle: TextStyle(
                                color: AppColors.grey(context),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          CustomButton(
                            width: double.maxFinite,
                            textColor: Colors.white,
                            title: 'Continue',
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Continue',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    '19 \$',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () {
                              widget.pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

final List<String> keys = [
  'Adults - \$ 9',
  'Elders - \$ 5',
  'Children - \$ 0',
  'Animals - \$ 9',
  'Luggage - \$ 2',
];
final List<String> values = [
  '( 10 to 60 Years old )',
  '( Above 60 Year old )',
  'under‘ 10 years of age accompanied by an adult going to the same place are to be carried free',
  'Carrying animals loose or in cages will be charged full adult rate.',
  'more than 2 pieces of luggage or packages/boxes, but shall not include grocery bagged items ',
];
