// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'package:chats/src/core/utils/constants/nums.dart';
import 'package:chats/src/core/utils/show_toast.dart';
import 'package:chats/src/data/sources/local/cashe_helper.dart';
import 'package:chats/src/domain/entities/sign_in_models/user_profile.dart';
import 'package:chats/src/domain/entities/sign_up_models/sign_up_validation_model.dart';
import 'package:chats/src/domain/usecase/sign_up_validation_usecase.dart';
import 'package:chats/src/presentation/blocs/sign_up/sign_up_event.dart';
import 'package:chats/src/presentation/blocs/sign_up/sign_up_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    //sign up
    on<SignUpEvents>(_onSignUpEvents);
    //already have account
    on<SignUpAlreadyHaveAccountEvent>(_onSignUpAlreadyHaveAccountEvent);
    //phone
    on<SignUpValidatePhoneEvents>(_onValidate);
    on<SignUpSubmittedPhoneNumberEvents>(_onSignUpSubmittedPhoneNumberEvent);
    on<SignUpChangedFullNameEvents>(_onSignUpChangedFullNameEvent);
    //sign up
    on<SignUpPressedClosedEvent>(_onSignUpPressedClosedEvent);
    on<SignUpNavigateToSignInScreenEvent>(_onSignUpNavigateToSignInScreenEvent);
    //full name
    on<SignUpValidateFullNameEvents>(_onSignUpValidateFullNameEvents);
    on<SignUpSubmittedFullNameEvents>(_onSignUpSubmittedFullNameEvent);
    //email
    on<SignUpChangedEmailEvents>(_onSignUpChangedEmailEvent);
    //password
    on<SignUpChangedPasswordEvents>(_onSignUpChangedPasswordEvent);
  }

  SignUpValidationUseCase signUpValidationUseCase = SignUpValidationUseCase();

  FutureOr<void> _onSignUpEvents(
      SignUpEvents event, Emitter<SignUpState> emit) async {
    emit(SignUpLoadingState());
    await Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      SignUpValidationModel validationModel = SignUpValidationModel();
      validationModel.validationMassagePhoneNumber =
          await signUpValidationUseCase.checkValidateMobile(event.phone);
      validationModel.validationMassagePassword =
          signUpValidationUseCase.validatePassword(event.password);
      validationModel.validationMassageEmail =
          signUpValidationUseCase.validateEmail(event.email);
      validationModel.validationMassageFullName =
          signUpValidationUseCase.validateFullName(event.name);
      signUp(
        email: event.email,
        pass: event.password,
        phone: event.phone,
        name: event.name,
        validationModel: validationModel
      );
    }).catchError((onError) {
      showToast(message: onError.toString(), state: ToastState.ERROR);
      emit(SignUpErrorState());
    });
  }

  Future<void> _onValidate(
      SignUpValidatePhoneEvents event, Emitter<SignUpState> emit) async {
    emit(SignUpInitialState());
    await Future.delayed(const Duration(seconds: 1)).then((value) async {
      await signUpValidationUseCase
          .checkValidateMobile(event.signUpPhoneNumber)
          .then((value) {
        emit(SignUpValidatePhoneNumberState(validationMassage: value));
      }).catchError((onError) {
        emit(SignUpErrorState());
      });
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpSubmittedPhoneNumberEvent(
      SignUpSubmittedPhoneNumberEvents event, Emitter<SignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      emit(SignUpSubmittedPhoneNumberState());
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpPressedClosedEvent(
      SignUpPressedClosedEvent event, Emitter<SignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      emit(SignUpPressedClosedState());
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpNavigateToSignInScreenEvent(
      SignUpNavigateToSignInScreenEvent event,
      Emitter<SignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      emit(SignUpNavigateToSignInScreenState());
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpValidateFullNameEvents(
      SignUpValidateFullNameEvents event, Emitter<SignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      String? validationMassage;
      if (event.signUpFullName.toString().isEmpty ||
          event.signUpFullName.toString().length < 3) {
        validationMassage = "Please Enter Valid Your Full Name";
      } else {
        validationMassage = null;
      }
      emit(SignUpValidateFullNameState(validationMassage: validationMassage));
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpSubmittedFullNameEvent(
      SignUpSubmittedFullNameEvents event, Emitter<SignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      String? validationMassage;
      if (event.signUpFullName.toString().isEmpty ||
          event.signUpFullName.toString().length < 3) {
        validationMassage = "Please Enter Valid Your Full Name";
      } else {
        validationMassage = null;
      }
      emit(SignUpValidateFullNameState(validationMassage: validationMassage));
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpChangedFullNameEvent(
      SignUpChangedFullNameEvents event, Emitter<SignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      String? validationMassage;
      if (event.signUpFullName.toString().isEmpty ||
          event.signUpFullName.toString().length < 3) {
        validationMassage = "Please Enter Valid Your Full Name";
      } else {
        validationMassage = null;
      }
      emit(SignUpValidateFullNameState(validationMassage: validationMassage));
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpChangedEmailEvent(
      SignUpChangedEmailEvents event, Emitter<SignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200)).then((value) {
      String? validateMassage;
      if (!EmailValidator.validate(event.signUpEmail)) {
        validateMassage = "Please Enter Your Valid Email Address";
      } else {
        validateMassage = null;
      }
      emit(SignUpChangedEmailState(validateMassage: validateMassage));
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpChangedPasswordEvent(
      SignUpChangedPasswordEvents event, Emitter<SignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      String? validationPassword;
      if (event.signUpPassword.toString().length < 7) {
        validationPassword = "Password is Very Short";
      } else {
        validationPassword = null;
      }
      emit(SignUpChangedPasswordState(validateMassage: validationPassword));
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  FutureOr<void> _onSignUpAlreadyHaveAccountEvent(
      SignUpAlreadyHaveAccountEvent event, Emitter<SignUpState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      emit(SignUpNavigateToSignInScreenState());
    }).catchError((onError) {
      emit(SignUpErrorState());
    });
  }

  void signUp({
    required String email,
    required String pass,
    required String phone,
    required String name,
    required  SignUpValidationModel validationModel,
  }) {
     emit(SignUpLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: pass,
    ).then((value) async {
      SharedHelper.save(key: 'uid', value: value.user!.uid.toString());
      var x = value;
      showToast(
          message: "Create Account Success ....", state: ToastState.SUCCESS);
      await storeDatabaseFirestore(
        email: email,
        pass: pass,
        phone: phone,
        name: name,
        uid: value.user!.uid.toString(),
      ).then((value) {
        emit(SignUpNavigateToHomeScreenState(validationModel));
      }).catchError((onError) {
        showToast(message: onError.toString(), state: ToastState.ERROR);
          emit(SignUpErrorState());
      });
    }).catchError((onError) {
      //emit(OrdersAppRegisterErrorStates(onError.toString()));
    });
  }

  Future storeDatabaseFirestore({
    required String email,
    required String pass,
    required String phone,
    required String name,
    required String uid,
  }) {
    UserProfile profile = UserProfile(
      phone: email,
      name: name,
      password: pass,
      email: phone,
      uid: uid,
    );
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users.doc(uid).set(profile.toMap());
  }
}
