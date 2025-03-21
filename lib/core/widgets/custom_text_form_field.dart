import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glide/core/theme/theme.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.icon,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.onChanged,
    this.minLines = 1,
    this.maxLines = 1, this.controller,
  });
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final IconData icon;
  final void Function(String)? onChanged;
  final int minLines;
  final int maxLines;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          keyboardType: keyboardType,
          validator: validator,
          minLines: minLines,
          maxLines: minLines,
          cursorColor: AppColors.primaryColor,
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
            fillColor: AppColors.secondaryColor,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.greyColor,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.secondaryColor,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
