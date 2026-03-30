import 'package:flutter/material.dart';

class SESInputBox extends StatelessWidget{
  final TextEditingController? controller;
  final String label;
  final String? hint;
  final bool isPassword;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;

  const SESInputBox({
    super.key,
    this.controller,
    required this.label,
    this.hint,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          onChanged: onChanged,
          style: const TextStyle(color: Colors.white, fontSize: 15),
          cursorColor: Colors.blue, //biba
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:  TextStyle(color: Colors.white.withValues(alpha: 0.2)),
            filled: true,
            fillColor: const Color(0xFF303F46),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            //border
            enabledBorder:  const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
            ),
            //border when clicked
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
            ),
          ),
        ),
      ],
    );
  }
}