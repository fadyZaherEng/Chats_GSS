import 'package:flutter/material.dart';

abstract class SignInEvent {}

class SignInEvents extends SignInEvent {
  String signInEmail, signInPassword;

  SignInEvents({
    required this.signInPassword,
    required this.signInEmail,
  });
}

class SignInSubmittedEmailEvent extends SignInEvent {
  String? signInEmail;

  SignInSubmittedEmailEvent({this.signInEmail});
}

class SignInPressedClosedEvent extends SignInEvent {}

class SignInPressedForgetPasswordEvent extends SignInEvent {
  String? signInEmail;

  SignInPressedForgetPasswordEvent({this.signInEmail});
}

class SignInNavigateToHomeScreenEvent extends SignInEvent {
  String signInEmail, signInPassword;

  SignInNavigateToHomeScreenEvent({
    required this.signInEmail,
    required this.signInPassword,
  });
}

class SignInNavigateToSignUpScreenEvent extends SignInEvent {
  BuildContext context;
  Widget screen;
  bool validate;

  SignInNavigateToSignUpScreenEvent({
    required this.context,
    required this.screen,
    this.validate = true,
  });
}

class SignInChangePasswordEvent extends SignInEvent {
  String? signInPassword;

  SignInChangePasswordEvent({required this.signInPassword});
}

class SignInValidateEmailEvent extends SignInEvent {
  String validateEmail;
  SignInValidateEmailEvent({required this.validateEmail});
}

class SignInChangeLangEvent extends SignInEvent {
  BuildContext context;
  SignInChangeLangEvent({required this.context});
}
