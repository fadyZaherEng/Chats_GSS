import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      color: HexColor('180040'),
      width: double.infinity,
      height: 1,
    );
  }
}
