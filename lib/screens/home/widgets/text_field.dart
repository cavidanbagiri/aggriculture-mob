import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController entering_controller;
  final label_text;
  const CustomTextField({super.key, required this.entering_controller, required this.label_text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextField(
        controller: entering_controller,
        decoration: InputDecoration(
          labelText: label_text,
          // prefixIcon: Icon(Icons.numbers),
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
      ),
    );
  }
}
