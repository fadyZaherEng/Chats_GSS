// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:chats/src/domain/entities/home_models/massage_model.dart';
import 'package:chats/src/presentation/blocs/home/home_bloc.dart';
import 'package:chats/src/presentation/screens/chat/widgets/build_receiver_massage_widget.dart';
import 'package:chats/src/presentation/screens/chat/widgets/build_sender_massage_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListViewWidget extends StatefulWidget {
  List<MassageModel> massages = [];

  ChatListViewWidget(this.massages, {super.key});

  @override
  State<ChatListViewWidget> createState() => _ChatListViewWidgetState();
}

class _ChatListViewWidgetState extends State<ChatListViewWidget> {
  HomeBloc get _bloc => BlocProvider.of<HomeBloc>(context);

  @override
  Widget build(BuildContext context) {
    return  ConditionalBuilder(
      condition: widget.massages.isNotEmpty,
      builder: (context) => Expanded(
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            reverse: true,
            //  controller: scrollController,
            itemBuilder: (context, index) {
              var massage = widget.massages[index];
              if (_bloc.userProfile!.uid == massage.senderId) {
                return BuildMassageSenderWidget(
                  massageModel: massage,
                  index: index,
                  context: context,
                );
              } else {
                return BuildMassageReceiverWidget(
                  massageModel: massage,
                  index: index,
                  context: context,
                );
              }
            },
            separatorBuilder: (context, index) =>
            const SizedBox(
              height: 15,
            ),
            itemCount: widget.massages.length),
      ),
      fallback: (context) => Expanded(
        child: Center(
          child: Text(
            'No Massages',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ),
    );
  }
}
