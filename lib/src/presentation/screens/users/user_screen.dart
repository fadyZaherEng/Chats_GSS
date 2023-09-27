// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_print
import 'package:chats/src/config/router/navigate_without_return.dart';
import 'package:chats/src/data/sources/local/cashe_helper.dart';
import 'package:chats/src/domain/entities/sign_in_models/user_profile.dart';
import 'package:chats/src/presentation/blocs/home/home_bloc.dart';
import 'package:chats/src/presentation/blocs/home/home_event.dart';
import 'package:chats/src/presentation/blocs/home/home_state.dart';
import 'package:chats/src/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:chats/src/presentation/screens/users/widgets/user_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatefulWidget {
  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  HomeBloc get _bloc => BlocProvider.of<HomeBloc>(context);
  Set<UserProfile> users = {};

  @override
  void initState() {
    super.initState();
    _bloc.add(HomeGetAllUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeGetUsersSuccessState) {
              users = state.users;
            }
            if(state is HomeSignOutState){
              SharedHelper.remove(key: 'uid');
              navigateToWithoutReturn(context: context, screen: const SignInScreen());
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {
                      _bloc.add(HomeSignOutEvent());
                  },
                  icon: const Icon(Icons.logout_outlined,color: Colors.black,),
                ),
              ),
              body: UserListViewWidget(users),
            );
          },
        );
      },
    );
  }
}
