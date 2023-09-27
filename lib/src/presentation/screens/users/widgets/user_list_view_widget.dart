import 'package:chats/src/domain/entities/sign_in_models/user_profile.dart';
import 'package:chats/src/presentation/screens/users/widgets/user_list_item_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class UserListViewWidget extends StatefulWidget {
  Set<UserProfile>users;

  UserListViewWidget(this.users, {super.key});

  @override
  State<UserListViewWidget> createState() => _UserListViewWidgetState();
}

class _UserListViewWidgetState extends State<UserListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition:widget.users.isNotEmpty,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) => UserListItemWidget(
              context,widget.users.elementAt(index)),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[300],
            ),
          ),
          itemCount:widget.users.length),
      fallback: (context) =>
      const Center(child: CircularProgressIndicator()),
    );
  }
}
