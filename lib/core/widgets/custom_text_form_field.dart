import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glide/core/utils/theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.icon,
    this.labelText,
    this.validator,
    this.keyboardType,
    this.onChanged,
    this.minLines = 1,
    this.maxLines = 1,
    this.controller,
  });
  final String? labelText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final IconData? icon;
  final void Function(String)? onChanged;
  final int minLines;
  final int maxLines;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      validator: validator,
      minLines: minLines,
      maxLines: minLines,
      cursorColor: AppColors.primary(context),
      autofillHints: const [AutofillHints.name],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      inputFormatters: keyboardType == TextInputType.number
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
          : [],
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: AppColors.grey(context),
        ),
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: AppColors.grey(context),
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary(context),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey(context),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey(context),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
