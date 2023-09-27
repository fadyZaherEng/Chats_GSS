import 'dart:async';

import 'package:chats/src/presentation/blocs/internet/internet_event.dart';
import 'package:chats/src/presentation/blocs/internet/internet_state.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc
    extends Bloc<InternetEvent, InternetState> {
  InternetBloc() : super(InitialAbstractionInternetState()) {
    on<InternetEvent>(_onInternetEvent);
  }
  FutureOr<void> _onInternetEvent(
      InternetEvent event, Emitter<InternetState> emit) {
    if (event is  ConnectInternetEvent) {
      emit(ConnectInternetState(massage: "Connected"));
    } else {
      emit(DisconnectInternetState(massage: "DisConnected"));
    }
  }
  void workLister(){
    Connectivity().onConnectivityChanged.listen((status) {
      if (status == ConnectivityResult.mobile ||
          status == ConnectivityResult.wifi) {
       add(ConnectInternetEvent());
      } else {
       add(DisConnectInternetEvent());
      }
    });
  }
}
