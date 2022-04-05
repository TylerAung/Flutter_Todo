import 'package:flutter/material.dart';

class formField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  //' Username'
  final IconData icon;
  //Icons.account_circle_rounded
  // bool isObsureText;

  formField({required this.controller,required this.hint, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFFFFFFF),
        prefixIcon: Icon(icon),
        hintText: hint,
      ),
    );
  }
}

