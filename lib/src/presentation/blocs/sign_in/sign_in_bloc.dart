// ignore_for_file: use_build_context_synchronously, avoid_print, invalid_use_of_visible_for_testing_member
import 'dart:async';
import 'package:chats/src/core/utils/constants/nums.dart';
import 'package:chats/src/core/utils/show_toast.dart';
import 'package:chats/src/data/sources/local/cashe_helper.dart';
import 'package:chats/src/domain/entities/sign_in_models/sign_in_validation_model.dart';
import 'package:chats/src/domain/usecase/sign_in_validation_use_case.dart';
import 'package:chats/src/presentation/blocs/sign_in/sign_in_event.dart';
import 'package:chats/src/presentation/blocs/sign_in/sign_in_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialStates()) {
    on<SignInEvents>(_onSignInSuccessEvent);
    on<SignInValidateEmailEvent>(_onSignInValidateEmailEvent);
    on<SignInSubmittedEmailEvent>(_onSignInSubmittedPhoneNumberEvent);
    on<SignInPressedForgetPasswordEvent>(_onSignInPressedForgetPasswordEvent);
    on<SignInPressedClosedEvent>(_onSignInPressedClosedEvent);
    on<SignInChangePasswordEvent>(_onSignInChangePasswordEvent);
    on<SignInNavigateToHomeScreenEvent>(_onSignInNavigateToHomeScreenEvent);
    on<SignInNavigateToSignUpScreenEvent>(_onSignInNavigateToSignUpScreenEvent);
  }

  FutureOr<void> _onSignInSuccessEvent(
      SignInEvents event, Emitter<SignInState> emit) async {
    emit(SignInLoadingState());
    await Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      login(event);
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInValidateEmailEvent(
      SignInValidateEmailEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoadingState());
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      SignInValidationUseCase signInValidationUseCase =
          SignInValidationUseCase();
      emit(SignInValidateEmailState(
          signInEmailValidationMassage:
              signInValidationUseCase.validateEmail(event.validateEmail)));
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  SignInValidationUseCase signInValidationUseCase = SignInValidationUseCase();

  FutureOr<void> _onSignInSubmittedPhoneNumberEvent(
      SignInSubmittedEmailEvent event, Emitter<SignInState> emit) async {
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      emit(SignInSubmittedPhoneNumberState());
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInPressedForgetPasswordEvent(
      SignInPressedForgetPasswordEvent event, Emitter<SignInState> emit) async {
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      emit(SignInPressedForgetPasswordState("25555"));
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInPressedClosedEvent(
      SignInPressedClosedEvent event, Emitter<SignInState> emit) async {
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      emit(SignInPressedClosedState());
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInChangePasswordEvent(
      SignInChangePasswordEvent event, Emitter<SignInState> emit) async {
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      emit(SignInChangePasswordStates(
          signInPasswordValidationMassage:
              signInValidationUseCase.validatePassword(event.signInPassword)));
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInNavigateToHomeScreenEvent(
      SignInNavigateToHomeScreenEvent event, Emitter<SignInState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) async {
      SignInValidationModel signInValidationModel = SignInValidationModel();
      signInValidationModel.validationMassageEmail =
          signInValidationUseCase.validateEmail(event.signInEmail);
      signInValidationModel.validationMassagePassword =
          signInValidationUseCase.validatePassword(event.signInPassword);
      emit(SignInNavigateToHomeScreenState(
          signInValidationModel: signInValidationModel));
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  FutureOr<void> _onSignInNavigateToSignUpScreenEvent(
      SignInNavigateToSignUpScreenEvent event,
      Emitter<SignInState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      emit(SignInNavigateToSignUpScreenState());
    }).catchError((onError) {
      emit(SignInErrorState());
    });
  }

  void login(SignInEvents event) async {
    SignInValidationModel signInValidationModel = SignInValidationModel();
    signInValidationModel.validationMassageEmail =
        signInValidationUseCase.validateEmail(event.signInEmail);
    signInValidationModel.validationMassagePassword =
        signInValidationUseCase.validatePassword(event.signInPassword);
    if (signInValidationModel.validationMassagePassword == null &&
        signInValidationModel.validationMassageEmail == null) {
      signIn(
          email: event.signInEmail,
          password: event.signInPassword,
          validateEmail: signInValidationModel.validationMassageEmail,
          validatepass: signInValidationModel.validationMassagePassword);
    } else {
      emit(SignInNavigateToHomeScreenState(
          signInValidationModel: signInValidationModel));
    }
  }

  void signIn({
    required String email,
    required String password,
    required String? validateEmail,
    required String? validatepass,
  }) {
    emit(SignInLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      SharedHelper.save(key: 'uid', value: value.user!.uid.toString());
      showToast(message: "Welcome", state: ToastState.SUCCESS);
      emit(SignInSuccessState());
      print(value.user!.email);
    }).catchError((onError) {
      showToast(message: onError.toString(), state: ToastState.ERROR);
      emit(SignInErrorState());
    });
  }
}
