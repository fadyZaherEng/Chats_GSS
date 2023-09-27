import 'package:email_validator/email_validator.dart';

class SignUpValidationUseCase {
  Future<String?> checkValidateMobile(String? value) async {
    return validateMobile(value);
  }

  String? validateMobile(String? value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{9,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value.toString().isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value.toString())) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String? validateFullName(String? value) {
    if (value.toString().isEmpty || value.toString().length < 3) {
      return "Please Enter Valid Your Full Name";
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value.toString().length < 7) {
      return "Password is Very Short";
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (!EmailValidator.validate(value.toString())) {
      return "Please Enter Your Valid Email Address";
    } else {
     return null;
    }
  }
}
