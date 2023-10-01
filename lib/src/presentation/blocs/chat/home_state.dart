import 'package:chats/src/domain/entities/home_models/massage_model.dart';
import 'package:chats/src/domain/entities/sign_in_models/user_profile.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeGetMassageSuccessState extends HomeState {
  List<MassageModel> massages;

  HomeGetMassageSuccessState(this.massages);
}

class HomeGetMassageErrorState extends HomeState {}

class HomeAddMassageSuccessState extends HomeState {}

class HomeAddMassageErrorState extends HomeState {}

class HomeGetUserSuccessState extends HomeState {
  UserProfile userProfile;

  HomeGetUserSuccessState({required this.userProfile});
}

class HomeUploadImageMassageSuccessState extends HomeState {}

class HomeUploadImageMassageLoadingState extends HomeState {}

class HomeUploadImageMassageErrorState extends HomeState {}

class HomeGetUsersSuccessState extends HomeState {
  Set<UserProfile> users;

  HomeGetUsersSuccessState({required this.users});
}

class HomeGetUserErrorState extends HomeState {}

class HomeSignOutState extends HomeState {}
