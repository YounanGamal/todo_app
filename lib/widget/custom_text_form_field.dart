import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    this.icon,
    this.obscureText = false,
    this.controller,
    // this.maxLines,
  });

  final String hintText;
  FormFieldValidator<String>? validator;
  TextEditingController? controller;
  Widget? icon;
  bool obscureText;
  // int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      // maxLines: maxLines,
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: Colors.red, fontSize: 14),
        suffixIcon: icon,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }
}
