import 'package:flutter/material.dart';
import '../strings/colors.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {super.key,
      required this.height,
      required this.width,
      required this.controller,
      required this.validator});

  final double width;
  final double height;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: SECONDARY,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(offset: Offset(2, 2), color: Colors.grey)
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: TextFormField(
          controller: controller,
          validator: validator,
        ),
      ),
    );
  }
}
