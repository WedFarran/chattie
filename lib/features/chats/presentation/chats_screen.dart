import 'package:chattie/core/strings/colors.dart';
import 'package:chattie/core/widgets/chattie_app_bar.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

class ChatsScreen extends StatelessWidget {
  static const String id = 'ChatsScreen';
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ChattieAppBar(
                size: size, screenName: 'Messages', backButtonVisible: false),
            SizedBox(
              height: size.height * 0.05,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context, ChatScreen.id),
                      child: Card(
                        color: BACKGROUND,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: BLUE,
                              radius: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Abed Farran',
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text(
                                  'datadatadatadatadatadata',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            SizedBox(
                              width: size.width * 0.1,
                            ),
                            Text(
                              '5:00pm',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
