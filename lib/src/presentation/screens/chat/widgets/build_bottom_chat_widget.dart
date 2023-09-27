import 'package:chats/src/data/sources/local/cashe_helper.dart';
import 'package:chats/src/presentation/blocs/home/home_bloc.dart';
import 'package:chats/src/presentation/blocs/home/home_event.dart';
import 'package:chats/src/presentation/blocs/home/home_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildBottomChatWidget extends StatefulWidget {
  dynamic context, state;
  TextEditingController textController;
  String receiverId;
  ScrollController scrollController;

  BuildBottomChatWidget({
    required this.context,
    required this.state,
    required this.textController,
    required this.receiverId,
    required this.scrollController
  });

  @override
  State<BuildBottomChatWidget> createState() => _BuildBottomChatWidgetState();
}

class _BuildBottomChatWidgetState extends State<BuildBottomChatWidget> {
  HomeBloc get _bloc => BlocProvider.of<HomeBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: SharedHelper.get(key: 'theme') == 'Light Theme'
            ? Colors.white
            : Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              maxLines: 1000,
              minLines: 1,
              validator: (val) {
                if (val!.isEmpty) {
                  return '';
                }
                return null;
              },
              controller: widget.textController,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'write here your massage...',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          if (widget.state is HomeLoadingState)
            const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink)),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5, right: 5),
            child: MaterialButton(
                height: 50,
                color: SharedHelper.get(key: 'theme') == 'Light Theme'
                    ? Colors.white
                    : Theme.of(context).scaffoldBackgroundColor,
                onPressed: () {
                  if (widget.textController.text != '') {
                    _bloc.add(
                      HomeAddMassagesEvent(
                        widget.receiverId,
                        widget.textController.text,
                        DateTime.now().toString(),
                        Timestamp.now().toString(),
                      ),
                    );
                    widget.textController.text = '';
                  }
                    widget.scrollController.jumpTo(widget.scrollController.position.maxScrollExtent);
                },
                child: const Icon(
                  Icons.send,
                  color: Colors.pink,
                  size: 25,
                )),
          ),
        ],
      ),
    );
  }
}
