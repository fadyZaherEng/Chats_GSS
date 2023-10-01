// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:chats/src/domain/entities/home_models/massage_model.dart';
import 'package:chats/src/domain/entities/sign_in_models/user_profile.dart';
import 'package:chats/src/presentation/blocs/chat/home_bloc.dart';
import 'package:chats/src/presentation/blocs/chat/home_state.dart';
import 'package:chats/src/presentation/screens/chat/widgets/build_receiver_text_massage_widget.dart';
import 'package:chats/src/presentation/screens/chat/widgets/build_reciever_image_widget.dart';
import 'package:chats/src/presentation/screens/chat/widgets/build_sender_i%20mage_widget.dart';
import 'package:chats/src/presentation/screens/chat/widgets/build_sender_text_massage_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListViewWidget extends StatefulWidget {
  List<MassageModel> massages = [];
  UserProfile? userProfile;
  ChatListViewWidget(this.massages, this.userProfile, {super.key});

  @override
  State<ChatListViewWidget> createState() => _ChatListViewWidgetState();
}

class _ChatListViewWidgetState extends State<ChatListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (state, context) {
        return ConditionalBuilder(
          condition: widget.massages.isNotEmpty,
          builder: (context) => Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                reverse: true,
                //  controller: scrollController,
                itemBuilder: (context, index) {
                  var massage = widget.massages[index];
                  if (massage.text != '') {
                    if (widget.userProfile!.uid == massage.senderId) {
                      return BuildTextMassageSenderWidget(
                        massageModel: massage,
                        index: index,
                        context: context,
                      );
                    } else {
                      return BuildTextMassageReceiverWidget(
                        massageModel: massage,
                        index: index,
                        context: context,
                      );
                    }
                  } else {
                    if (widget.userProfile!.uid == massage.senderId) {
                      return BuildImageMassageSenderWidget(
                        massageModel: massage,
                        context: context,
                        index: index,
                      );
                    } else {
                      return BuildImageMassageReceiverWidget(
                        massageModel: massage,
                        context: context,
                        index: index,
                      );
                    }
                  }
                },
                separatorBuilder: (context, index) => const SizedBox(
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
      },
    );
  }
}
