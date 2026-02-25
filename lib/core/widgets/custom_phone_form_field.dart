import 'package:country_flags/country_flags.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glide/core/utils/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class PhoneFormCubit extends Cubit<PhoneFormState> {
  PhoneFormCubit() : super(const PhoneFormState()) {
    emit(const PhoneFormState(
      selectedCountry: 'CA',
      countryCode: '1',
    ));
  }

  void updateSelectedCountry(Country country) {
    emit(state.copyWith(
        selectedCountry: country.countryCode, countryCode: country.phoneCode));
  }

  void clearSelection() {
    emit(state.copyWith(selectedCountry: '', countryCode: ''));
  }
}

class PhoneFormState extends Equatable {
  final String selectedCountry;
  final String countryCode;

  const PhoneFormState({this.selectedCountry = '', this.countryCode = ''});

  PhoneFormState copyWith({String? selectedCountry, String? countryCode}) {
    return PhoneFormState(
      selectedCountry: selectedCountry ?? this.selectedCountry,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  @override
  List<Object> get props => [selectedCountry, countryCode];
}

class CustomPhoneFormField extends StatelessWidget {
  const CustomPhoneFormField({
    super.key,
    this.onTap,
    this.padding,
    this.readOnly,
    this.controller,
    this.onChanged,
    this.enablePicker = true,
    required this.selectedCountry,
    required this.countryCode,
    this.onChangedCountry,
  });

  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final bool? readOnly;
  final bool enablePicker;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(Country)? onChangedCountry;
  final String selectedCountry;
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PhoneFormCubit(),
      child: BlocBuilder<PhoneFormCubit, PhoneFormState>(
        builder: (context, state) {
          return Material(
            color: AppColors.background(context),
            child: Container(
              margin: padding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTap: enablePicker
                            ? () {
                                showCountryPicker(
                                  context: context,
                                  useSafeArea: true,
                                  countryListTheme: CountryListThemeData(
                                    bottomSheetHeight:
                                        ScreenUtil().screenHeight * .7,
                                    padding: const EdgeInsets.only(top: 16),
                                  ),
                                  onSelect: (Country country) {
                                    onChangedCountry?.call(country);
                                    context
                                        .read<PhoneFormCubit>()
                                        .updateSelectedCountry(country);
                                  },
                                );
                              }
                            : null,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          constraints:
                              BoxConstraints(minHeight: 64.h, maxHeight: 64.h),
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey(context),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            children: [
                              CountryFlag.fromCountryCode(
                                state.selectedCountry.toUpperCase(),
                                theme: ImageTheme(
                                  width: 38.w,
                                  height: 24.h,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Icon(
                                FontAwesomeIcons.chevronDown,
                                size: 12.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      readOnly: readOnly ?? false,
                      controller: controller,
                      onTap: onTap,
                      onChanged: onChanged,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 20.0),
                        constraints:
                            BoxConstraints(minHeight: 65.h, maxHeight: 65.h),
                        filled: true,
                        fillColor: AppColors.lightGrey(context),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 8.0),
                          child: Text(
                            '(+${state.countryCode}) ',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: AppColors.grey(context),
                                    ),
                          ),
                        ),
                        hintText: '999-9999',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: AppColors.grey(context),
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.error(context),
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
