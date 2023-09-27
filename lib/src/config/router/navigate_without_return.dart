import 'package:flutter/material.dart';

void navigateToWithoutReturn({
  required BuildContext context,
  required Widget screen,
}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => screen
        ), (Route<dynamic>route) => false);

}
