import 'package:chattie/core/strings/colors.dart';
import 'package:chattie/core/widgets/chattie_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/friend_widget.dart';

class AddFriends extends StatelessWidget {
  static const String id = 'AddFriends';
  const AddFriends({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ChattieAppBar(
              size: size,
              screenName: 'Add friends',
              backButtonVisible: true,
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            Container(
                height: size.height * 0.07,
                width: size.width * 0.8,
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                decoration: BoxDecoration(
                    color: SECONDARY, borderRadius: BorderRadius.circular(50)),
                alignment: Alignment.topCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: size.width * 0.58, child: TextField()),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          size: 50,
                        ))
                  ],
                )),
            SizedBox(
              height: size.height * 0.07,
            ),
            FriendsWidget(
                size: size,
                name: 'Abed Farran',
                widget: FloatingActionButton(
                  backgroundColor: ORANGE,
                  onPressed: () {},
                  mini: true,
                  child: const Text('+', style: TextStyle(fontSize: 20)),
                ))
          ],
        ),
      ),
    );
  }
}
