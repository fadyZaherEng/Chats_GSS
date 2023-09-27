// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable
import 'package:chats/src/config/router/navigate_with_return.dart';
import 'package:chats/src/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:chats/src/presentation/widgets/email_text_filed_widget.dart';
import 'package:chats/src/presentation/widgets/password_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignInBodyWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  void Function(String value) onChangeEmail;
  void Function(String value) onSubmittedEmail;
  void Function() onPressedClosed;
  void Function() navigateToHomeScreen;
  void Function() navigateToSignUpScreen;
  void Function(String value) onChangePassword;
  void Function() onPressedForgetPassword;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  String? validationMessageEmail;
  String? validationMessagePassword;

  SignInBodyWidget({
    super.key,
    required this.formKey,
    required this.navigateToHomeScreen,
    required this.navigateToSignUpScreen,
    required this.onPressedForgetPassword,
    required this.onChangePassword,
    required this.onPressedClosed,
    required this.onChangeEmail,
    required this.validationMessagePassword,
    required this.validationMessageEmail,
    required this.passwordController,
    required this.emailController,
    required this.onSubmittedEmail,
  });

  @override
  State<SignInBodyWidget> createState() => _SignInBodyWidgetState();
}

class _SignInBodyWidgetState extends State<SignInBodyWidget> {
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                         "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      EmailTextFiledWidget(
                        controller: widget.emailController,
                        onChangedEmail: widget.onChangeEmail,
                        errorMSG: widget.validationMessageEmail,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      PasswordTextFieldWidget(
                        controller: widget.passwordController,
                        onChanged: widget.onChangePassword,
                        errorMSG: widget.validationMessagePassword,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      MaterialButton(
                        height: 50,
                        minWidth: double.infinity,
                        onPressed:widget.navigateToHomeScreen,
                        color: HexColor('180040'),
                        child:  const Text(
                          "Sign In",
                          style:TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don\"t have an account?",
                              style: Theme.of(context).textTheme.bodyMedium),
                          TextButton(
                            onPressed: () {
                                navigateToWithReturn(context: context, screen: const SignUpScreen());
                            },
                            child: Text(
                              "REGISTER",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              ))),
    );
  }
}
