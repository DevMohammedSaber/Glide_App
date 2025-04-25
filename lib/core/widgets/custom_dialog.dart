import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glide/core/utils/navigation/app_routes.dart';
import 'package:glide/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';

Future<void> showCustomDialog({
  required BuildContext context,
  required Widget child,
  double? height,
  void Function()? onClosePressed,
}) async {
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
              height: height,
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
                    child: child,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: onClosePressed ??
                          () {
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
