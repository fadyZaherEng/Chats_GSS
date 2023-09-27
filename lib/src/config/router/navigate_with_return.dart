import 'package:flutter/material.dart';

void navigateToWithReturn({
required BuildContext context,
required Widget screen,
}) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context)=>screen
            ));
}