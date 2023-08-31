import 'package:chattie/core/strings/colors.dart';
import 'package:chattie/core/strings/images.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const String id = 'ChatScreen';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                BLUE_LOGO,
                width: size.width * 0.4,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: BLUE,
                    radius: 30,
                  ),
                  SizedBox(
                    width: size.width * 0.15,
                  ),
                  const Text(
                    'Abed Farran',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            const Text(
              'Today',
              style: TextStyle(color: Colors.grey),
            ),
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: size.height * 0.07,
                width: size.width * 0.5,
                color: SECONDARY,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.08,
                width: size.width * 0.8,
                padding: const EdgeInsets.only(left: 9),
                decoration: BoxDecoration(
                    color: SECONDARY, borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    SizedBox(width: size.width * 0.6, child: const TextField()),
                    FloatingActionButton(
                      backgroundColor: BLUE,
                      onPressed: () {},
                      child: const Text(
                        '>',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(size.height, 0)
      ..quadraticBezierTo(
          size.width / 4, size.height - 40, size.width / 2, size.height - 20)
      ..quadraticBezierTo(
          3 / 4 * size.width, size.height, size.width, size.height - 30)
      ..lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
