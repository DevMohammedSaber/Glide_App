import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void showSnackBar(
    {String? title,
    required String message,
    required BuildContext context,
    Color? color}) {
  final snckBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        color: color,
        title: title ?? '',
        message: message,
        contentType: ContentType.failure,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        messageTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ));
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snckBar);
}
