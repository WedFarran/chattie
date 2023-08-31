import 'package:chattie/core/strings/colors.dart';
import 'package:chattie/core/strings/images.dart';
import 'package:flutter/material.dart';

import 'presentation/widgets/info_widget.dart';

class FriendProfile extends StatelessWidget {
  static const String id = 'FriendProfile';
  const FriendProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: BLUE,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(height: size.height * 0.07),
            const Center(
              child: CircleAvatar(
                backgroundColor: BLUE,
                radius: 70,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'Abed Farran',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Info(
              size: size,
              label: 'Age:',
              info: '50',
            ),
            Info(
              size: size,
              label: 'Birthday:',
              info: '1989/8/8',
            ),
            Info(
              size: size,
              label: 'Nationality:',
              info: 'Saudi',
            ),
            Info(
              size: size,
              label: 'City:',
              info: 'Makkah',
            ),
            Info(
              size: size,
              label: 'Hobbies:',
              info: 'Driving',
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.07,
                color: BLUE.withOpacity(0.25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Delete',
                      style: TextStyle(fontSize: 17),
                    ),
                    Image.asset(
                      TRASH,
                      height: size.height * 0.05,
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
