import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glide/core/theme/theme.dart';
import 'package:glide/core/widgets/custom_button.dart';
import 'package:glide/gen/assets.gen.dart';

class TicketWidget extends StatefulWidget {
  const TicketWidget({
    super.key,
    this.padding,
    this.margin,
    this.color = Colors.white,
    this.isCornerRounded = false,
    this.shadow,
    required this.keys,
    required this.values,
    required this.title,
  });
  final String title;
  final List<String> keys;
  final List<String> values;
  final Color color;
  final bool isCornerRounded;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<BoxShadow>? shadow;

  @override
  State<TicketWidget> createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: Container(
        width: double.infinity,
        height: 270.h,
        padding: widget.padding,
        margin: widget.margin,
        decoration: BoxDecoration(
          boxShadow: widget.shadow,
          color: AppColors.lightGrey(context),
          borderRadius: widget.isCornerRounded
              ? BorderRadius.circular(20.0)
              : BorderRadius.circular(0.0),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Inuit Heritage Center'.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                            Text(
                              'Jan 01, 5:42pm',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SvgPicture.asset(
                          Assets.svg.busTrip,
                          width: 90.w,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Conferenc...'.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                            Text(
                              'Jan 01, 5:59pm',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomDashedLine(
              color: Colors.grey[400]!,
            ),
            Expanded(
              child: Builder(builder: (context) {
                final itemCount = ((widget.keys.length / 4).remainder(1) == 0
                    ? widget.keys.length + 4
                    : (widget.keys.length / 4).remainder(1) == .25
                        ? widget.keys.length + 3
                        : (widget.keys.length / 4).remainder(1) == .5
                            ? widget.keys.length + 2
                            : widget.keys.length + 1);
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 5,
                    childAspectRatio: 2,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 23),
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    if (index == itemCount - 1) {
                      return CustomButton(
                        bgColor: AppColors.darkGrey(context),
                        textColor: AppColors.text(context),
                        title: 'Rebook',
                        textStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                        onPressed: () {},
                      );
                    }
                    final adjustedIndex =
                        index > widget.keys.length ? index - 1 : index;

                    if (adjustedIndex >= widget.keys.length) {
                      return const SizedBox();
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.keys[adjustedIndex],
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.grey(context),
                                    fontSize: 12.sp,
                                  ),
                        ),
                        Text(
                          widget.values[adjustedIndex],
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height / 2), radius: 20.0));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2), radius: 20.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomDashedLine extends StatelessWidget {
  final double height;
  final Color color;

  const CustomDashedLine(
      {super.key, this.height = 1, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 5.0;
        final dashSpace = 5.0;
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
