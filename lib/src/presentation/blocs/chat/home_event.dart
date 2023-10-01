abstract class HomeEvent {}

class HomeGetAllUsersEvent extends HomeEvent {}

class HomeGetCurrentUserEvent extends HomeEvent {}

class HomeSignOutEvent extends HomeEvent {}

class HomeGetMassagesEvent extends HomeEvent {
  String receiverId;
  HomeGetMassagesEvent({required this.receiverId});
}

class HomeAddMassagesEvent extends HomeEvent {
  String receiverId, text, dateTime, createdAt, image;

  HomeAddMassagesEvent(
      this.receiverId, this.text, this.dateTime, this.createdAt, this.image);
}

class HomeUploadImageMassagesEvent extends HomeEvent {
  String receiverId, text, dateTime, createdAt;

  HomeUploadImageMassagesEvent(
      this.receiverId, this.text, this.dateTime, this.createdAt);
}
