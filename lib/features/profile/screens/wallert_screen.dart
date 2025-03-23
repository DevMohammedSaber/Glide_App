import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glide/core/theme/theme.dart';
import 'package:glide/features/profile/widgets/dashed_container.dart';
import 'package:glide/gen/assets.gen.dart';

class WallertScreen extends StatelessWidget {
  const WallertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Glide Wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Glide Wallet',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(height: 13.h),
            SizedBox(
              height: 125.h,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(
                            Assets.png.walletCardBackground.path,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 16.h, left: 16.w),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(Assets.svg.walletLogo),
                                      SizedBox(width: 8.w),
                                      Text(
                                        'Wallet',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              height: 1.h,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.w, bottom: 5),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '\$ ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                color: Colors.white,
                                              ),
                                        ),
                                        TextSpan(
                                          text: '147',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                        ),
                                        TextSpan(
                                          text: '.35',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  DashedBorderContainer(
                    width: 80.w,
                    height: 124.h,
                    radius: 16,
                    bgColor: AppColors.lightGreyColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          FontAwesomeIcons.plus,
                          size: 24.sp,
                          color: const Color(0xff989898),
                        ),
                        Text(
                          'Top\nup',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: const Color(0xff989898),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Payment Methods',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(height: 13.h),
            Expanded(
              child: ListView.builder(
                itemCount: _images.length,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (_, index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        height: 40.w,
                        child: Image.asset(
                          _images[index],
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              _items[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              _hints[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.darkGreyColor,
                                  ),
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.angleRight,
                              color: AppColors.greyColor,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> _items = [
  'Add Card',
  'Mary’s Credit ●●● 5231',
  'My Debit Card ●●● 6512',
  'Apple Pay',
  'Cash',
];
List<String> _hints = [
  'Add a card of any bank',
  'MasterCard',
  'Visa',
  '',
  '',
];
List<String> _images = [
  Assets.png.addCard.path,
  Assets.png.mastercard.path,
  Assets.png.visa.path,
  Assets.png.applePay.path,
  Assets.png.cash.path
];
