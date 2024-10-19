import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      this.hintText,
      required this.controller,
      this.maxLines,
      this.validator});
  final String? hintText;
  final TextEditingController controller;
  final int? maxLines;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(fontSize: 20),
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.normal)),
      ),
    );
  }
}
