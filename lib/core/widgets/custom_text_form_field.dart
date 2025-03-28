import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glide/core/utils/theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.icon,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.onChanged,
    this.minLines = 1,
    this.maxLines = 1,
    this.controller,
  });
  final String? hintText;
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
      textAlign: TextAlign.center,
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
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.grey(context),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey(context),
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
