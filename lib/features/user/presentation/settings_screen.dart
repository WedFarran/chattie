import 'package:chattie/core/strings/images.dart';
import 'package:chattie/core/widgets/chattie_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/strings/colors.dart';
import '../../auth/presentation/phone_number.dart';
import '../../user/presentation/widgets/info_widget.dart';
import 'edit_profile_screen.dart';
import 'provider/logout_provider.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = 'SettingsScreen';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<LogoutNotifier>(builder: (context, logoutNotifier, child) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ChattieAppBar(
                  size: size, screenName: 'Profile', backButtonVisible: false),
              SizedBox(
                height: size.height * 0.05,
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, EditProfileScreen.id),
                  child: Image.asset(
                    EDIT,
                    height: size.height * 0.04,
                  ),
                ),
              ),
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
                onTap: () => Navigator.of(context)
                    .popUntil(ModalRoute.withName(PhoneNumberAuth.id)),
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.07,
                  color: BLUE.withOpacity(0.25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.logout_outlined,
                        size: 40,
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      const Text(
                        'Logout',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        width: size.width * 0.45,
                      ),
                      const Text(
                        '>',
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
