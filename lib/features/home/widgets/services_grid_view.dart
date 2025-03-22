import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glide/gen/assets.gen.dart';

class ServicesGridView extends StatelessWidget {
  const ServicesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              ServiceItem(
                image: Assets.svg.taxi,
                label: 'Taxi',
              ),
              ServiceItem(
                image: Assets.svg.bus,
                label: 'Bus',
              ),
              ServiceItem(
                image: Assets.svg.elder,
                label: 'Elderly Bus',
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ServiceItem(
                image: Assets.svg.food,
                title: 'Food',
                label: '',
              ),
              ServiceItem(
                image: Assets.svg.market,
                title: 'Market',
                label: '',
              ),
              ServiceItem(
                image: Assets.svg.medicine,
                title: 'Medicine',
                label: '',
              ),
              ServiceItem(
                image: Assets.svg.more,
                title: 'More',
                label: '',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  const ServiceItem(
      {super.key, required this.image, required this.label, this.title});
  final String image;
  final String label;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: title == null ? 110.h : 82.h,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                SizedBox(
                  height: 45.h,
                  child: SvgPicture.asset(
                    image,
                  ),
                ),
                SizedBox(height: 10.h),
                if (title == null)
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                const Spacer(),
              ],
            ),
          ),
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                title!,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
