import 'package:chattie/core/strings/colors.dart';
import 'package:chattie/features/chats/presentation/chat_screen.dart';
import 'package:chattie/features/user/presentation/add_friends.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/chattie_app_bar.dart';
import '../../../core/widgets/friend_widget.dart';
import '../friend_profile.dart';

class Friends extends StatelessWidget {
  const Friends({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //  int index = 5;
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 120.0),
          child: FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, AddFriends.id),
            backgroundColor: ORANGE,
            child: const Text(
              '+',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                ChattieAppBar(
                  size: size,
                  screenName: 'Friends',
                  backButtonVisible: false,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 150.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 9,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, FriendProfile.id),
                          child: FriendsWidget(
                              size: size,
                              name: 'Abed Farran',
                              widget: IconButton(
                                  onPressed: () => Navigator.pushNamed(
                                      context, ChatScreen.id),
                                  icon: const Icon(Icons.chat))),
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
