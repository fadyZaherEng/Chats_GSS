import 'package:flutter/material.dart';

class EmailTextFiledWidget extends StatelessWidget {
  TextEditingController controller;
  void Function(String value) onChangedEmail;
  String? errorMSG;

  EmailTextFiledWidget({
    super.key,
    required this.controller,
    required this.onChangedEmail,
    required this.errorMSG,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        errorText: errorMSG,
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        label: const Text("Email Address"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromRGBO(226, 226, 226, 1),
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromRGBO(226, 226, 226, 1),
            )),
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      validator: (val) {
        return errorMSG;
      },
      keyboardType: TextInputType.emailAddress,
      onChanged: onChangedEmail,
    );
  }
}
