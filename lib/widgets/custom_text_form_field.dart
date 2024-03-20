
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;
  final bool obsecureText;
  final IconData? icon;
  const CustomTextFormField(
      {super.key,
      required this.textController,
      required this.labelText,
      required this.icon,
      this.obsecureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        labelText: labelText.toString(),
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Color.fromARGB(255, 248, 247, 247),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.purple),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 230, 226, 226)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email cant be empty';
        }
        return null;
      },
      obscureText: obsecureText,
    );
  }
}
