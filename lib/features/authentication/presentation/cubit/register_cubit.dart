import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glide/features/authentication/domain/usecases/register_usecase.dart';
import 'package:glide/features/authentication/presentation/cubit/register_states.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterUsecase registerUsecase;

  RegisterCubit(this.registerUsecase) : super(const RegisterStateInitial());

  final btnController = RoundedLoadingButtonController();

  final PhoneController phoneNumber = PhoneController(
    initialValue: const PhoneNumber(isoCode: IsoCode.EG, nsn: ''),
  );
  final TextEditingController nameFormField = TextEditingController();
  final TextEditingController emailFormField = TextEditingController();
  final TextEditingController phoneFormField = TextEditingController();
  final TextEditingController passwordFormField = TextEditingController();
  final TextEditingController confirmPasswordFormField =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future register() async {
    if (!formKey.currentState!.validate()) {
      btnController.stop();
      btnController.reset();
      return;
    }
    emit(const RegisterStateLoading());
    final response = await registerUsecase.call(
      email: emailFormField.text,
      password: passwordFormField.text,
      userName: nameFormField.text,
      phoneNumber: phoneNumber.value.countryCode + phoneNumber.value.nsn,
    );
    response.fold((l) {
      emit(
        RegisterStateError(error: l.message),
      );
      btnController.error();
    }, (r) {
      btnController.success();
    });
    Future.delayed(const Duration(seconds: 2), () {
      btnController.stop();
      btnController.reset();
    });
  }
}
