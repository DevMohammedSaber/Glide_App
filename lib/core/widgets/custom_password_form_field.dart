import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glide/core/utils/theme/app_colors.dart';

class CustomPasswordFormField extends StatefulWidget {
  const CustomPasswordFormField({
    super.key,
    required this.controller,
    required this.hintText, this.validator,
  });
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool isPasswordVisible = true;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isPasswordVisible,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [AutofillHints.password],
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.text(context),
      ),
      onChanged: (value) {},
      validator: widget.validator,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColors.primary(context),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey(context),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: AppColors.grey(context),
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            togglePasswordVisibility();
          },
          child: !isPasswordVisible
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.visibility,
                    color: AppColors.primary(context),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.visibility_off,
                    color: AppColors.grey(context),
                  ),
                ),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            Icons.lock,
            color: AppColors.grey(context),
          ),
        ),
        labelText: widget.hintText,
        labelStyle: TextStyle(
          color: AppColors.grey(context),
        ),
      ),
    );
  }
}
