import 'package:flutter/material.dart';
import '../strings/colors.dart';

class FriendsWidget extends StatelessWidget {
  const FriendsWidget(
      {super.key,
      required this.size,
      required this.widget,
      required this.name});

  final Size size;
  final Widget widget;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: BLUE.withOpacity(0.25),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              backgroundColor: BACKGROUND,
              radius: 30,
            ),
            const Text('Abed Farran'),
            SizedBox(
              width: size.width * 0.15,
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
