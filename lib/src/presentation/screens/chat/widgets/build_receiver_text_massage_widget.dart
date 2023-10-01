import 'package:chats/src/core/utils/get_time.dart';
import 'package:chats/src/domain/entities/home_models/massage_model.dart';
import 'package:flutter/material.dart';

class BuildTextMassageReceiverWidget extends StatefulWidget {
  MassageModel massageModel;
  int index;
  BuildContext context;

  BuildTextMassageReceiverWidget({
    required this.massageModel,
    required this.index,
    required this.context,
  });

  @override
  State<BuildTextMassageReceiverWidget> createState() =>
      _BuildTextMassageReceiverWidgetState();
}

class _BuildTextMassageReceiverWidgetState
    extends State<BuildTextMassageReceiverWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(10),
                  topEnd: Radius.circular(10),
                  bottomEnd: Radius.circular(10),
                ),
              ),
              child: Text(
                widget.massageModel.text,
                style: Theme.of(context).textTheme.bodyText2,
                maxLines: 1000,
                softWrap: true,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 5,
                end: 5,
              ),
              child: Text(
                getTime(widget.massageModel.dateTime),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
