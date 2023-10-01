import 'package:chats/src/domain/entities/home_models/massage_model.dart';
import 'package:flutter/material.dart';

class BuildImageMassageSenderWidget extends StatefulWidget {
  MassageModel massageModel;
  int index;
  BuildContext context;

  BuildImageMassageSenderWidget({
    required this.massageModel,
    required this.index,
    required this.context,
  });

  @override
  State<BuildImageMassageSenderWidget> createState() =>
      _BuildImageMassageSenderWidgetState();
}

class _BuildImageMassageSenderWidgetState
    extends State<BuildImageMassageSenderWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Align(
        alignment: AlignmentDirectional.centerEnd,
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
