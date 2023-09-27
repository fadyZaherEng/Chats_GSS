import 'package:email_validator/email_validator.dart';

class SignInValidationUseCase {
  String? validateEmail(String? value) {
    if (!EmailValidator.validate(value.toString())) {
      return "Please Enter Your Valid Email Address";
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value.toString().length < 7) {
      return "Password is very Short";
    } else {
      return null;
    }
  }
}