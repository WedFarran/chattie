import 'package:flutter/material.dart';

import '../strings/colors.dart';

class BlueButton extends StatelessWidget {
  const BlueButton(
      {super.key,
      required this.size,
      required this.buttonName,
      required this.onTap});

  final Size size;
  final String buttonName;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height * 0.08,
        decoration: BoxDecoration(
            color: BLUE,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(offset: Offset(2, 2), color: Colors.grey)
            ]),
        alignment: Alignment.center,
        child: Text(
          buttonName,
          style: const TextStyle(color: BACKGROUND, fontSize: 25),
        ),
      ),
    );
  }
}
