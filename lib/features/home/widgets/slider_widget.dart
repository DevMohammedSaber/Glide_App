import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:glide/core/theme/theme.dart';
import 'package:glide/gen/assets.gen.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    super.key,
  });

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider.builder(
          itemCount: 4,
          options: CarouselOptions(
            autoPlay: true,
            disableCenter: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            aspectRatio: 2.6,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index.toDouble();
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                Assets.png.banner.path,
                fit: BoxFit.fill,
              ),
            );
          },
        ),
        DotsIndicator(
          dotsCount: 4,
          animate: true,
          position: currentIndex,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            activeSize: const Size(18, 6),
            size: const Size(6, 6),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }
}
