import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glide/core/utils/theme/app_colors.dart';
import 'package:phone_form_field/phone_form_field.dart';

class CustomPhoneFormField extends StatelessWidget {
  const CustomPhoneFormField({
    super.key,
    required this.controller,
    this.validators,
    this.autovalidateMode,
    this.labelText,
    this.validator,
  });

  final PhoneController controller;
  final List<String? Function(PhoneNumber?)>? validators;
  final AutovalidateMode? autovalidateMode;
  final String? labelText;
  final String? Function(PhoneNumber?)? validator;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PhoneFormField(
        controller: controller,
        autovalidateMode: autovalidateMode,
        autofillHints: const [AutofillHints.telephoneNumber],
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        validator: validator ??
            PhoneValidator.compose(
              [
                PhoneValidator.required(context,
                    errorText: "Please Enter Mobile Number"),
                PhoneValidator.validMobile(context,
                    errorText: "Invalid Mobile Number"),
                ...?validators,
              ],
            ),
        countrySelectorNavigator: CountrySelectorNavigator.dialog(
          backgroundColor: AppColors.background(context),
          searchBoxIconColor: AppColors.lightGrey(context),
          searchBoxDecoration: InputDecoration(
            hintText: "Search",
            icon: Icon(
              Icons.search,
              color: AppColors.lightGrey(context),
            ),
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.text(context),
            ),
          ),
          searchBoxTextStyle: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.text(context),
          ),
          subtitleStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.text(context),
          ),
          titleStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.text(context),
          ),
        ),
        countryButtonStyle: CountryButtonStyle(
          flagSize: 16.r,
          showDropdownIcon: false,
          textStyle: TextStyle(
            color: AppColors.text(context),
          ),
        ),
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          labelText: "Phone Number",
          labelStyle: TextStyle(
            color: AppColors.grey(context),
          ),
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
      ),
    );
  }
}
