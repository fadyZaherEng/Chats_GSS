abstract class InternetState{}

class InitialAbstractionInternetState extends InternetState{}
class ConnectInternetState extends InternetState{
  String massage;

  ConnectInternetState({required this.massage});
}
class DisconnectInternetState extends InternetState{
  String massage;

  DisconnectInternetState({required this.massage});
}