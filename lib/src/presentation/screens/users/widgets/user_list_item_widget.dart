import 'package:chats/src/config/router/navigate_with_return.dart';
import 'package:chats/src/domain/entities/sign_in_models/user_profile.dart';
import 'package:chats/src/presentation/screens/chat/home_screen.dart';
import 'package:flutter/material.dart';

class UserListItemWidget extends StatefulWidget {
  BuildContext context;
  UserProfile userProfile;

  UserListItemWidget(this.context, this.userProfile, {super.key});

  @override
  State<UserListItemWidget> createState() => _UserListItemWidgetState();
}

class _UserListItemWidgetState extends State<UserListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: double.infinity,
        child: Card(
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
          color: Colors.black12,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: Text(
                    widget.userProfile.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userProfile.email,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.userProfile.phone,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        navigateToWithReturn(
            context: context, screen: ChatScreen(widget.userProfile));
      },
    );
  }
}
