import 'package:chats/src/core/utils/get_time.dart';
import 'package:chats/src/domain/entities/home_models/massage_model.dart';
import 'package:flutter/material.dart';

class BuildTextMassageSenderWidget extends StatefulWidget {
  MassageModel massageModel;
  int index;
  BuildContext context;

  BuildTextMassageSenderWidget({
    super.key,
    required this.massageModel,
    required this.index,
    required this.context,
  });

  @override
  State<BuildTextMassageSenderWidget> createState() =>
      _BuildTextMassageSenderWidgetState();
}

class _BuildTextMassageSenderWidgetState
    extends State<BuildTextMassageSenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
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
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(10),
                  topEnd: Radius.circular(10),
                  bottomStart: Radius.circular(10),
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
        ],
      ),
    );
  }
}
