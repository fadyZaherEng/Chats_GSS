// ignore_for_file: avoid_print, invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:chats/src/core/utils/constants/nums.dart';
import 'package:chats/src/core/utils/show_toast.dart';
import 'package:chats/src/data/sources/local/cashe_helper.dart';
import 'package:chats/src/domain/entities/home_models/massage_model.dart';
import 'package:chats/src/domain/entities/sign_in_models/user_profile.dart';
import 'package:chats/src/presentation/blocs/home/home_event.dart';
import 'package:chats/src/presentation/blocs/home/home_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeGetAllUsersEvent>(_onHomeGetAllUsersEvent);
    on<HomeGetMassagesEvent>(_onHomeGetMassagesEvent);
    on<HomeAddMassagesEvent>(_onHomeAddMassagesEvent);
    on<HomeSignOutEvent>(_onHomeSignOutEvent);
  }

  UserProfile? userProfile;

  void getUserProfile() {
    emit(HomeLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(SharedHelper.get(key: 'uid'))
        .snapshots()
        .listen((event) {
      userProfile = UserProfile.fromJson(event.data());
      emit(HomeGetUserSuccessState(userProfile: userProfile!));
    }).onError((handleError) {
      emit(HomeGetMassageErrorState());
    });
  }

  //add massages
  void addMassage({
    required String receiverId,
    required String? text,
    required String dateTime,
    required String createdAt,
  }) {
    emit(HomeLoadingState());
    MassageModel model = MassageModel(
      senderId: userProfile!.uid,
      receiverId: receiverId,
      text: text,
      dateTime: dateTime,
      createdAt: createdAt,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userProfile!.uid)
        .collection('chats')
        .doc(receiverId)
        .collection('massages')
        .add(model.toMap())
        .then((value) {
      emit(HomeAddMassageSuccessState());
    }).catchError((onError) {
      emit(HomeAddMassageErrorState());
    });
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userProfile!.uid)
        .collection('massages')
        .add(model.toMap())
        .then((value) {
      emit(HomeAddMassageSuccessState());
    }).catchError((onError) {
      emit(HomeAddMassageErrorState());
    });
  }
  List<MassageModel> massages = [];
  //get massages
  void getMassage({
    required String receiverId,
  }) {
    print(receiverId);
    print(userProfile!.uid);
    emit(HomeLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userProfile!.uid)
        .collection('chats')
        .doc(receiverId)
        .collection('massages')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((event) {
      massages = [];
      for (var element in event.docs) {
        massages.add(MassageModel.fromJson(element.data()));
      }
      emit(HomeGetMassageSuccessState(massages));
    }).onError((error) {
      emit(HomeGetMassageErrorState());
    });
  }

  //get all users
  Set<UserProfile> users = {};

  void getAllUsers() async {
    emit(HomeLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .orderBy('name')
        .snapshots()
        .listen((event) async {
      users.clear();
      for (var element in event.docs) {
        if (element.data()['uid'] != SharedHelper.get(key: 'uid')) {
          users.add(UserProfile.fromJson(element.data()));
        }
      }
      emit(HomeGetUsersSuccessState(users: users));
    }).onError((handleError) {
      emit(HomeGetUserErrorState());
    }); //uid
  }

  FutureOr<void> _onHomeGetAllUsersEvent(HomeGetAllUsersEvent event,
      Emitter<HomeState> emit) {
    getAllUsers();
  }

  FutureOr<void> _onHomeGetMassagesEvent(HomeGetMassagesEvent event,
      Emitter<HomeState> emit) {
    getMassage(receiverId: event.receiverId);
  }

  FutureOr<void> _onHomeAddMassagesEvent(HomeAddMassagesEvent event,
      Emitter<HomeState> emit) {
    addMassage(
      receiverId: event.receiverId,
      text: event.text,
      dateTime: event.dateTime,
      createdAt: event.createdAt,
    );
  }

  FutureOr<void> _onHomeSignOutEvent(HomeSignOutEvent event,
      Emitter<HomeState> emit)async {
   emit(HomeLoadingState());
   await FirebaseAuth.instance
        .signOut()
        .then((value) {
          emit(HomeSignOutState());
    }).catchError((onError){
      showToast(message: onError.toString(), state: ToastState.ERROR);
      emit(HomeGetUserErrorState());
    });
  }
}
