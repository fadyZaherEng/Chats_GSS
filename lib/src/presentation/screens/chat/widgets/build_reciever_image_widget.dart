import 'package:chats/src/domain/entities/home_models/massage_model.dart';
import 'package:flutter/material.dart';

class BuildImageMassageReceiverWidget extends StatefulWidget {
  MassageModel massageModel;
  int index;
  BuildContext context;

  BuildImageMassageReceiverWidget({
    required this.massageModel,
    required this.index,
    required this.context,
  });

  @override
  State<BuildImageMassageReceiverWidget> createState() =>
      _BuildImageMassageReceiverWidgetState();
}

class _BuildImageMassageReceiverWidgetState
    extends State<BuildImageMassageReceiverWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Image(
          image: NetworkImage(widget.massageModel.image),
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {},
    );
  }
}
