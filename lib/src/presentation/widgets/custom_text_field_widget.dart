import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  TextEditingController controller;
  void Function(String value) onChanged;
  void Function(String value) onSubmitted;
  String? errorMSG;
  String text;

  CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onSubmitted,
    required this.errorMSG,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        errorText: errorMSG,
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        label: Text(text),
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
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
    );
  }
}
