
import 'package:chats/src/domain/entities/sign_up_models/sign_up_validation_model.dart';

abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpErrorState extends SignUpState {}

class SignUpPressedClosedState extends SignUpState {}

class SignUpNavigateToHomeScreenState extends SignUpState {
  SignUpValidationModel validationModel;

  SignUpNavigateToHomeScreenState(this.validationModel);
}

class SignUpNavigateToSignInScreenState extends SignUpState {}

class SignUpValidateFullNameState extends SignUpState {
  String? validationMassage;

  SignUpValidateFullNameState({required this.validationMassage});
}

class SignUpSubmittedFullNameState extends SignUpState {
  String? signUpFullName;

  SignUpSubmittedFullNameState({this.signUpFullName});
}

class SignUpChangedFullNameState extends SignUpState {
  String? signUpFullName;

  SignUpChangedFullNameState({this.signUpFullName});
}

class SignUpSubmittedPhoneNumberState extends SignUpState {}

class SignUpValidatePhoneNumberState extends SignUpState {
  String? validationMassage;

  SignUpValidatePhoneNumberState({required this.validationMassage});
}

class SignUpChangedEmailState extends SignUpState {
  String? validateMassage;

  SignUpChangedEmailState({this.validateMassage});
}

class SignUpChangedPasswordState extends SignUpState {
  String? validateMassage;

  SignUpChangedPasswordState({this.validateMassage});
}
