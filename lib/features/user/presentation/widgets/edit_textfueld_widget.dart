import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({super.key, required this.hint});

  final String hint;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.only(top: 15),
        height: size.height * 0.07,
        width: size.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.60),
            borderRadius: BorderRadius.circular(15)),
        child: TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hint,
          ),
        ));
  }
}
