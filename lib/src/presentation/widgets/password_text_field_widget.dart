// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  void Function(String value) onChanged;
  String? errorMSG;
  PasswordTextFieldWidget({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.errorMSG,
  });

  @override
  State<PasswordTextFieldWidget> createState() => _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  Icon? _suffixIcon;
  bool _obscure = true;
@override
  void initState() {
    super.initState();
    changeEye();
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        errorText: widget.errorMSG,
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        suffixIcon: IconButton(
          onPressed: () {
            changeObscure();
            changeEye();
          },
          icon: _suffixIcon!
        ),
        label:  const Text("Password"),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromRGBO(226, 226, 226, 1),
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromRGBO(226, 226, 226, 1),
            )),
      ),
      style: Theme.of(context).textTheme.bodyText2,
      validator: (val) {
        return widget.errorMSG;
      },
      obscureText: _obscure,
      onChanged: widget.onChanged,
      keyboardType: TextInputType.visiblePassword,
    );
  }

  void changeObscure() {
    _obscure = !_obscure;
    setState(() {});
  }

  void changeEye() {
    if (_obscure) {
      _suffixIcon = const Icon(
        Icons.remove_red_eye_outlined,
        color: Colors.grey,
      );
    } else {
      _suffixIcon = const Icon(
        Icons.visibility_off_outlined,
        color: Colors.grey,
      );
    }
    setState(() {});
  }
}
