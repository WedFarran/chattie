import 'package:chattie/core/strings/colors.dart';
import 'package:chattie/core/strings/images.dart';
import 'package:chattie/features/friends/presentation/friends.dart';
import 'package:flutter/material.dart';

import '../../features/chats/presentation/chats_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';

class ChattieBottomNavigationBar extends StatefulWidget {
  static const String id = 'ChattieBottomNavigationBar';
  const ChattieBottomNavigationBar({super.key});

  @override
  State<ChattieBottomNavigationBar> createState() =>
      _ChattieBottomNavigationBarState();
}

class _ChattieBottomNavigationBarState
    extends State<ChattieBottomNavigationBar> {
  List<Widget> screens = [Friends(), ChatsScreen(), SettingsScreen()];

  int i = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: [
        Center(child: screens.elementAt(i)),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 25.0,
          ),
          child: Container(
            height: size.height * 0.1,
            width: size.width * 0.8,
            decoration: BoxDecoration(
                color: BLUE,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.25))
                ]),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => setState(() {
                    i = 0;
                  }),
                  child: Image.asset(
                    i == 0 ? EMPLOYEES_SELECTED : EMPLOYEES,
                    width: size.width * 0.1,
                  ),
                ),
                InkWell(
                  onTap: () => setState(() {
                    i = 1;
                  }),
                  child: Image.asset(
                    i == 1 ? CHAT_SELECTED : CHAT,
                    width: size.width * 0.1,
                  ),
                ),
                InkWell(
                  onTap: () => setState(() {
                    i = 2;
                  }),
                  child: Image.asset(
                    i == 2 ? CHAT_SELECTED : CHAT,
                    width: size.width * 0.1,
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
