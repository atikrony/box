import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Text text;
  final TextInputType inputType;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.text,
    required this.inputType,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      obscureText: obscureText,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 211, 211, 211),
        focusColor: const Color.fromARGB(137, 255, 179, 179),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 176, 255, 85),
            width: 3,
          ),
        ),
        label: text,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.blueGrey,
            width: 5,
          ),
        ),
      ),
    );
  }
}
