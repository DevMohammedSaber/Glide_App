import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glide/core/theme/theme.dart';
import 'package:glide/core/widgets/custom_app_bar.dart';
import 'package:glide/core/widgets/custom_empty_widget.dart';
import 'package:glide/features/history/widgets/ticket_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'History',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 40.h,
                child: TabBar(
                  indicator: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelColor: AppColors.whiteColor,
                  unselectedLabelColor: AppColors.blackColor,
                  dividerHeight: 0,
                  splashBorderRadius: BorderRadius.circular(15),
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  labelStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 14,
                  ),
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Tab(text: 'All Trips'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Tab(text: 'Taxi'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Tab(text: 'Bus'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Tab(text: 'Food'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Tab(text: 'Market'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.separated(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        final List<String> titles = [
                          'Bus Trip',
                          'taxi Trip',
                        ];
                        final List<List<String>> keysData = [
                          [
                            'Passengers',
                            'Rest stops',
                            'Ticket fare',
                            'Ticket no.',
                          ],
                          [
                            'Trip fare',
                            'Trip Status',
                          ],
                        ];
                        final List<List<String>> valuesData = [
                          [
                            '2 Adults',
                            '1 Stop',
                            '\$7.50',
                            '42WLd94',
                            'Completed',
                          ],
                          [
                            '\$7.50',
                            'Completed',
                          ],
                        ];
                        return TicketWidget(
                          title: titles[index],
                          isCornerRounded: true,
                          padding: const EdgeInsets.all(20),
                          keys: keysData[index],
                          values: valuesData[index],
                        );
                      },
                      separatorBuilder: (_, index) => SizedBox(height: 16.h),
                    ),
                    ListView.separated(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return const TicketWidget(
                          title: 'Taxi Trip',
                          isCornerRounded: true,
                          padding: EdgeInsets.all(20),
                          keys: [
                            'Trip fare',
                            'Trip Status',
                          ],
                          values: [
                            '\$7.50',
                            'Completed',
                          ],
                        );
                      },
                      separatorBuilder: (_, index) => SizedBox(height: 16.h),
                    ),
                    ListView.separated(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return const TicketWidget(
                          title: 'Bus Trip',
                          isCornerRounded: true,
                          padding: EdgeInsets.all(20),
                          keys: [
                            'Passengers',
                            'Rest stops',
                            'Ticket fare',
                            'Ticket no.',
                          ],
                          values: [
                            '2 Adults',
                            '1 Stop',
                            '\$7.50',
                            '42WLd94',
                            'Completed',
                          ],
                        );
                      },
                      separatorBuilder: (_, index) => SizedBox(height: 16.h),
                    ),
                    const CustomEmptyWidget(),
                    const CustomEmptyWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
