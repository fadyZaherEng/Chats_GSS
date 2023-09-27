import 'package:flutter/material.dart';

abstract class SignUpEvent {}

class SignUpUpInitialEvents extends SignUpEvent {}

class SignUpEvents extends SignUpEvent {
  String email;
  String password;
  String phone;
  String name;

  SignUpEvents({
    required this.phone,
    required this.name,
    required this.password,
    required this.email,
  });
}

class SignUpPressedClosedEvent extends SignUpEvent {}

class SignUpNavigateToSignInScreenEvent extends SignUpEvent {
  BuildContext context;
  Widget screen;
  bool validate;

  SignUpNavigateToSignInScreenEvent({
    required this.context,
    required this.screen,
    this.validate = true,
  });
}

class SignUpAlreadyHaveAccountEvent extends SignUpEvent {
  BuildContext context;
  Widget screen;
  bool validate;

  SignUpAlreadyHaveAccountEvent({
    required this.context,
    required this.screen,
    this.validate = true,
  });
}

class SignUpValidateFullNameEvents extends SignUpEvent {
  String signUpFullName;

  SignUpValidateFullNameEvents({required this.signUpFullName});
}
class SignUpChangedFullNameEvents extends SignUpEvent {
  String? signUpFullName;

  SignUpChangedFullNameEvents({this.signUpFullName});
}
class SignUpSubmittedFullNameEvents extends SignUpEvent {
  String? signUpFullName;

  SignUpSubmittedFullNameEvents({this.signUpFullName});
}

class SignUpSubmittedPhoneNumberEvents extends SignUpEvent {
  String? signUpPhoneNumber;

  SignUpSubmittedPhoneNumberEvents({this.signUpPhoneNumber});
}

class SignUpValidatePhoneEvents extends SignUpEvent {
  String signUpPhoneNumber;

  SignUpValidatePhoneEvents({required this.signUpPhoneNumber});
}
class SignUpChangedEmailEvents extends SignUpEvent {
  String signUpEmail;

  SignUpChangedEmailEvents({required this.signUpEmail});
}
class SignUpChangedPasswordEvents extends SignUpEvent {
  String signUpPassword;

  SignUpChangedPasswordEvents({required this.signUpPassword});
}