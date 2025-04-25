import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glide/core/utils/helpers/snack_bar.dart';
import 'package:glide/core/utils/navigation/app_routes.dart';
import 'package:glide/core/widgets/custom_button.dart';
import 'package:glide/core/widgets/custom_text_form_field.dart';
import 'package:glide/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';

Future<void> showRatingDialog(
    {required BuildContext context, required int rideId}) async {
  showDialog(
      context: context,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 5,
            child: SizedBox(
              height: 400.h,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 40.h),
                        const Text(
                          'Rate your ride',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          itemSize: 50,
                          allowHalfRating: true,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(height: 16.h),
                        const CustomTextFormField(
                          minLines: 3,
                          labelText: 'Comments',
                        ),
                        SizedBox(height: 40.h),
                        CustomButton(
                          width: double.infinity,
                          onPressed: () {
                            context.push(AppRoutes.layoutScreen);
                            showSnackBar(
                              context: context,
                              color: Colors.green,
                              title: 'Thanks!',
                              message: 'Your rating has been submitted',
                            );
                          },
                          title: 'Submit',
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        context.push(AppRoutes.layoutScreen);
                      },
                    ),
                  ),
                  Positioned(
                    top: -30,
                    child: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          Assets.svg.darkGlideLogo,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
