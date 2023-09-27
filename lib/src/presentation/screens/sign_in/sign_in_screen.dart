// ignore_for_file: must_be_immutable, deprecated_member_use, avoid_print
import 'package:chats/src/config/router/navigate_with_return.dart';
import 'package:chats/src/config/router/navigate_without_return.dart';
import 'package:chats/src/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:chats/src/presentation/blocs/sign_in/sign_in_event.dart';
import 'package:chats/src/presentation/blocs/sign_in/sign_in_state.dart';
import 'package:chats/src/presentation/screens/sign_in/widgets/sign_in_body_widget.dart';
import 'package:chats/src/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:chats/src/presentation/screens/users/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? _validationMessageEmail;
  String? _validationMessagePassword;
  final _formKey = GlobalKey<FormState>();
  SignInBloc get _bloc => BlocProvider.of<SignInBloc>(context);
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc,SignInState>(
      listener: (context, state) {
        if (state is SignInValidateEmailState) {
          _validationMessageEmail = state.signInEmailValidationMassage;
        }
        if (state is SignInChangePasswordStates) {
          _validationMessagePassword = state.signInPasswordValidationMassage;
        }
        if (state is SignInSuccessState) {
            navigateToWithoutReturn(
              context: context,
              screen:  UsersScreen(),
            );
           // showToast(message: "Success", state: ToastState.SUCCESS);
        }
        if (state is SignInNavigateToHomeScreenState) {
          _validationMessagePassword = state.signInValidationModel.validationMassagePassword;
          _validationMessageEmail = state.signInValidationModel.validationMassageEmail;
        }
        if (state is SignInNavigateToSignUpScreenState) {
          navigateToWithReturn(
            context: context,
            screen: const SignUpScreen(),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SignInBodyWidget(
              formKey: _formKey,
              onChangeEmail: (value) {
                _bloc.add(
                    SignInValidateEmailEvent(validateEmail: value));
              },
              passwordController: _passwordController,
              emailController: _emailController,
              onSubmittedEmail: (String value) {
                _bloc.add(
                    SignInSubmittedEmailEvent(signInEmail: value));
              },
              validationMessagePassword: _validationMessagePassword,
              validationMessageEmail: _validationMessageEmail,
              onChangePassword: (String value) {
                _bloc.add(SignInChangePasswordEvent(signInPassword: value));
              },
              onPressedClosed: () {
                _bloc.add(SignInPressedClosedEvent());
              },
              onPressedForgetPassword: () {
                _bloc.add(SignInPressedForgetPasswordEvent(
                    signInEmail: _emailController.text));
              },
              navigateToHomeScreen: () {
                _bloc.add(
                  SignInEvents(
                      signInEmail: _emailController.text,
                      signInPassword: _passwordController.text,
                  ),
                );
              },
              navigateToSignUpScreen: () {
                _bloc.add(
                  SignInNavigateToSignUpScreenEvent(
                    context: context,
                    screen: const SignUpScreen(),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
