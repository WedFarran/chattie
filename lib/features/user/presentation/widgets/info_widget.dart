import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info(
      {super.key, required this.size, required this.info, required this.label});

  final Size size;
  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            width: size.width * 0.4,
          ),
          Text(
            info,
            style: TextStyle(fontSize: 20, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
