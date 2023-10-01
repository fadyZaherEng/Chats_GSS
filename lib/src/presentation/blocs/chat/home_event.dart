abstract class HomeEvent{}

class HomeGetAllUsersEvent extends HomeEvent{}
class HomeSignOutEvent extends HomeEvent{}
class HomeGetMassagesEvent extends HomeEvent{
  String receiverId;

  HomeGetMassagesEvent({required this.receiverId});
}
class HomeAddMassagesEvent extends HomeEvent{
  String receiverId, text, dateTime, createdAt;

  HomeAddMassagesEvent(
      this.receiverId, this.text, this.dateTime, this.createdAt);
}