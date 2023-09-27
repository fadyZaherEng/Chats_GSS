import 'package:chats/src/config/router/navigate_with_return.dart';
import 'package:chats/src/domain/entities/sign_in_models/user_profile.dart';
import 'package:chats/src/presentation/blocs/home/home_bloc.dart';
import 'package:chats/src/presentation/blocs/home/home_event.dart';
import 'package:chats/src/presentation/screens/chat/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListItemWidget extends StatefulWidget {
  BuildContext context;
  UserProfile userProfile;

  UserListItemWidget(this.context, this.userProfile);

  @override
  State<UserListItemWidget> createState() => _UserListItemWidgetState();
}

class _UserListItemWidgetState extends State<UserListItemWidget> {
  HomeBloc get _bloc => BlocProvider.of<HomeBloc>(context);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.userProfile.name,
                        style:const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize:22,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment:MainAxisAlignment.start ,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.userProfile.email,
                          style:const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize:17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.userProfile.phone,
                          style:const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize:17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        _bloc.add(HomeGetMassagesEvent(receiverId: widget.userProfile!.uid));
        navigateToWithReturn(context: context, screen: ChatScreen(widget.userProfile));
      },
    );
  }
}
