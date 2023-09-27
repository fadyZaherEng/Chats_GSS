import 'package:chats/src/domain/entities/sign_in_models/sign_in_validation_model.dart';
import 'package:flutter/material.dart';

abstract class SignInState {}

class SignInSubmittedPhoneNumberState extends SignInState {}

class SignInPressedClosedState extends SignInState {}
class SignInChangeLangState extends SignInState {
  Locale locale;
  SignInChangeLangState(this.locale);
}
class SignInPressedForgetPasswordState extends SignInState {
  String signInPassword;

  SignInPressedForgetPasswordState(this.signInPassword);
}

class SignInNavigateToHomeScreenState extends SignInState {
  SignInValidationModel signInValidationModel;
  SignInNavigateToHomeScreenState({required this.signInValidationModel});
}

class SignInNavigateToSignUpScreenState extends SignInState {}

class SignInChangePasswordStates extends SignInState {
  String? signInPasswordValidationMassage;

  SignInChangePasswordStates({required this.signInPasswordValidationMassage});
}

class SignInInitialStates extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {
}

class SignInErrorState extends SignInState {}

class SignInValidateEmailState extends SignInState {
  String? signInEmailValidationMassage;

  SignInValidateEmailState({required this.signInEmailValidationMassage});
}
