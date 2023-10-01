import 'package:chats/src/domain/entities/home_models/massage_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

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
        child: SizedBox(
          height: 150,
          width: 150,
          child: Stack(
            children: [
              const Center(child: CircularProgressIndicator()),
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.massageModel.image,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
