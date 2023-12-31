// ignore_for_file: deprecated_member_use
import 'package:chats/src/domain/entities/home_models/massage_model.dart';
import 'package:chats/src/domain/entities/sign_in_models/user_profile.dart';
import 'package:chats/src/presentation/blocs/home/home_bloc.dart';
import 'package:chats/src/presentation/blocs/home/home_event.dart';
import 'package:chats/src/presentation/blocs/home/home_state.dart';
import 'package:chats/src/presentation/screens/chat/widgets/build_bottom_chat_widget.dart';
import 'package:chats/src/presentation/screens/chat/widgets/chat_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  UserProfile? receiverProfile;
  ChatScreen(this.receiverProfile, {super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController textController = TextEditingController();
  ScrollController scrollController=ScrollController();
  HomeBloc get _bloc => BlocProvider.of<HomeBloc>(context);
  List<MassageModel> massages = [];

  @override
  void initState() {
    super.initState();
    _bloc.add(HomeGetMassagesEvent(receiverId: widget.receiverProfile!.uid));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeGetMassageSuccessState) {
          massages = state.massages;
        }

      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar:getAppBar(),
            body: Padding(
              padding: const EdgeInsetsDirectional.only(
                  top: 20, start: 10, end: 10, bottom: 8),
              child: Column(
                children: [
                  if (massages.isNotEmpty)
                    ChatListViewWidget(massages),
                  if (massages.isEmpty) const Spacer(),
                  BuildBottomChatWidget(
                    context: context,
                    state: state,
                    receiverId: widget.receiverProfile!.uid,
                    textController: textController,
                    scrollController: scrollController,
                  ),
                ],
              ),
            ));
      },
    );
  }

 PreferredSizeWidget getAppBar() {
    return  AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_circle_left,color: Colors.black,)),
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.receiverProfile!.name,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black),
        ),
      ),
    );
 }
}
