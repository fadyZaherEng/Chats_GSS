import 'package:chats/src/presentation/widgets/custom_text_field_widget.dart';
import 'package:chats/src/presentation/widgets/email_text_filed_widget.dart';
import 'package:chats/src/presentation/widgets/password_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpBodyWidget extends StatefulWidget {
  //massage
  String? validationMassageFullName;
  String? validationMassagePhoneNumber;
  String? validationMassageEmail;
  String? validationMassagePassword;

  final GlobalKey<FormState> formKey;
  //phone
  void Function(String value) onChangedPhoneNumber;
  void Function(String value) onSubmittedPhoneNumber;
  void Function() onPressesClosed;
  //name
  void Function(String value) onPressedSubmittedFullName;
  void Function(String value) onPressedChangedFullName;
  //email
  void Function(String value) onPressedChangedEmail;
  //password
  void Function(String value) onPressedChangedPassword;
  //controller
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  //sign up
  void Function() signUpOnPressed;
  //sign in
  void Function() onPressedAlreadyAccount;
  SignUpBodyWidget({
    super.key,
    required this.validationMassagePhoneNumber,
    required this.validationMassageEmail,
    required this.validationMassageFullName,
    required this.validationMassagePassword,
    required this.phoneController,
    required this.onChangedPhoneNumber,
    required this.passwordController,
    required this.formKey,
    required this.emailController,
    required this.nameController,
    required this.onPressedSubmittedFullName,
    required this.onPressedChangedFullName,
    required this.onPressesClosed,
    required this.onSubmittedPhoneNumber,
    required this.onPressedChangedEmail,
    required this.onPressedChangedPassword,
    required this.signUpOnPressed,
    required this.onPressedAlreadyAccount,
  });

  @override
  State<SignUpBodyWidget> createState() => _SignUpBodyWidgetState();
}

class _SignUpBodyWidgetState extends State<SignUpBodyWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: widget.formKey,
            child: Column(
              children: [
                const Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextFieldWidget(
                  controller: widget.nameController,
                  errorMSG:widget.validationMassageFullName,
                  text: "Full Name",
                  onSubmitted:widget.onPressedSubmittedFullName,
                  onChanged: widget.onPressedChangedFullName,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFieldWidget(
                  controller: widget.phoneController,
                  text: "Phone Number",
                  errorMSG: widget.validationMassagePhoneNumber,
                  onChanged: widget.onChangedPhoneNumber,
                  onSubmitted:widget.onSubmittedPhoneNumber,
                ),
                const SizedBox(
                  height: 15,
                ),
                EmailTextFiledWidget(
                  controller: widget.emailController,
                  onChangedEmail: widget.onPressedChangedEmail,
                  errorMSG: widget.validationMassageEmail,
                ),
                const SizedBox(
                  height: 15,
                ),
                PasswordTextFieldWidget(
                  controller: widget.passwordController,
                  onChanged: widget.onPressedChangedPassword,
                  errorMSG: widget.validationMassagePassword,
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  height: 50,
                  minWidth: double.infinity,
                  onPressed: widget.signUpOnPressed,
                  color: HexColor('180040'),
                  child:  const Text(
                    "REGISTER NOW",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
